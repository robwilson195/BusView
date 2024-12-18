//
//  TripViewModel.swift
//  BusView
//
//  Created by Catherine Megregian on 07/11/2024.
//

import Foundation

enum TripViewState {
    case loading
    case error(Error)
    case loaded(activeTrip: Trip, activeQuote: Quote)
}

enum TripProcessingError: Error {
    case noTrips
    case generic
}

class TripViewModel: ObservableObject {
    
    @Published var viewState: TripViewState = .loading
    @Published var errorOverlayMessage: String?
    private let routeService: RouteServicing
    private var cachedQuotes: QuoteResponse?
    
    init(routeService: RouteServicing) {
        self.routeService = routeService
    }
    
    @MainActor
    func onViewAppear(time: Date = .now) async {
        viewState = .loading
        do {
            try await refreshQuotes()
            let (quote, trip) = try await firstQuoteWithTrimmedTrip(.after, time)
            errorOverlayMessage = nil
            viewState = .loaded(activeTrip: trip, activeQuote: quote)
        } catch {
            viewState = .error(error)
        }
    }
    
    @MainActor
    func onPreviousTapped() async {
        do {
            guard case let .loaded(_, quote) = viewState,
                  let currentDeparture = quote.legs.first?.departure.scheduled else {
                throw TripProcessingError.generic
            }
            try await refreshQuotes()
            let (olderQuote, olderTrip) = try await firstQuoteWithTrimmedTrip(.before, currentDeparture)
            errorOverlayMessage = nil
            viewState = .loaded(activeTrip: olderTrip, activeQuote: olderQuote)
        } catch {
            errorOverlayMessage = "No previous trips available."
        }
    }
    
    @MainActor
    func onNextTapped() async {
        do {
            guard case let .loaded(_, quote) = viewState,
                  let currentDeparture = quote.legs.first?.departure.scheduled else {
                throw TripProcessingError.generic
            }
            try await refreshQuotes()
            let (nextQuote, nextTrip) = try await firstQuoteWithTrimmedTrip(.after, currentDeparture)
            errorOverlayMessage = nil
            viewState = .loaded(activeTrip: nextTrip, activeQuote: nextQuote)
        } catch {
            errorOverlayMessage = "No subsequent trips available."
        }
    }
    
    @MainActor
    func onRefreshTapped() async {
        do {
            guard case let .loaded(_, quote) = viewState,
                  let leg = quote.legs.first else {
                throw TripProcessingError.generic
            }
            
            try await refreshQuotes()
            let (refreshedQuote, refreshedTrip) = try await firstQuoteWithTrimmedTrip(.at, leg.departure.scheduled)
            errorOverlayMessage = nil
            viewState = .loaded(activeTrip: refreshedTrip, activeQuote: refreshedQuote)
        } catch {
            errorOverlayMessage = "There was an issue refreshing this route. Information may be out of date."
        }
    }
    
    
    private func refreshQuotes() async throws {
        do  {
            cachedQuotes = try await routeService.getQuotes()
        }
    }
}
extension TripViewModel {
    enum DateContext {
        case before, after, at
    }
    
    private func firstQuoteWithTrimmedTrip(_ context: DateContext, _ date: Date) async throws -> (Quote, Trip) {
        let quote: Quote? = {
            switch context {
            case .after:
                return cachedQuotes?.soonestQuote(after: date)
            case .before:
                return cachedQuotes?.mostRecentQuote(before: date)
            case .at:
                return cachedQuotes?.quoteDeparting(at: date)
            }
        }()
        
        guard let quote, let leg = quote.legs.first else {
            throw TripProcessingError.noTrips
        }
        
        let scheduledDeparture = leg.departure.scheduled
        let scheduledArrival = leg.arrival.scheduled
        var trip = try await routeService.getTrip(id: leg.tripUid)
        trip.trimStops(before: scheduledDeparture, after: scheduledArrival)
        return (quote, trip)
    }
    
}

