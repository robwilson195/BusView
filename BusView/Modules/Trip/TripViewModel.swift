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

enum ProcessingError: Error {
    case noTrips
    case generic
}

class TripViewModel: ObservableObject {
    
    @Published var viewState: TripViewState = .loading
    private let routeService: RouteServicing
    private var cachedQuotes: QuoteResponse?
    
    init(routeService: RouteServicing) {
        self.routeService = routeService
    }
    
    @MainActor
    func onViewAppear() async {
        do {
            try await refreshQuotes()
            let (quote, trip) = try await firstQuoteWithTrimmedTrip(.after, .now)
            viewState = .loaded(activeTrip: trip, activeQuote: quote)
        } catch {
            viewState = .error(error)
        }
    }
    
    private func refreshQuotes() async throws {
        do  {
            cachedQuotes = try await routeService.getQuotes()
        }
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
            throw ProcessingError.noTrips
        }
        
        let scheduledDeparture = leg.departure.scheduled
        let scheduledArrival = leg.arrival.scheduled
        var trip = try await routeService.getTrip(id: leg.tripUid)
        trip.trimStops(before: scheduledDeparture, after: scheduledArrival)
        return (quote, trip)
    }
    
    @MainActor
    func onPreviousTapped() async {
        do {
            guard case let .loaded(_, quote) = viewState,
            let currentDeparture = quote.legs.first?.departure.scheduled else {
                throw ProcessingError.generic
            }
            try await refreshQuotes()
            let (olderQuote, olderTrip) = try await firstQuoteWithTrimmedTrip(.before, currentDeparture)
            viewState = .loaded(activeTrip: olderTrip, activeQuote: olderQuote)
        } catch {
            viewState = .error(error)
        }
    }
    
    @MainActor
    func onNextTapped() async {
        do {
            guard case let .loaded(_, quote) = viewState,
            let currentDeparture = quote.legs.first?.departure.scheduled else {
                throw ProcessingError.generic
            }
            try await refreshQuotes()
            let (nextQuote, nextTrip) = try await firstQuoteWithTrimmedTrip(.after, currentDeparture)
            viewState = .loaded(activeTrip: nextTrip, activeQuote: nextQuote)
        } catch {
            viewState = .error(error)
        }
    }
    
    @MainActor
    func onRefreshTapped() async {
        do {
            guard case let .loaded(_, quote) = viewState,
                  let leg = quote.legs.first else {
                throw ProcessingError.generic
            }
            
            try await refreshQuotes()
            let (refreshedQuote, refreshedTrip) = try await firstQuoteWithTrimmedTrip(.at, leg.departure.scheduled)
            viewState = .loaded(activeTrip: refreshedTrip, activeQuote: refreshedQuote)
        } catch {
            viewState = .error(error)
        }
    }
}


extension QuoteResponse {
    func soonestQuote(after date: Date) -> Quote? {
        let departureTimes = quotes.map(\.legs.first?.departure.scheduled)
        for (index, departureTime) in departureTimes.enumerated() {
            if departureTime ?? .distantPast > date { return quotes[index] }
        }
        return nil
    }
    
    func mostRecentQuote(before date: Date) -> Quote? {
        let flippedQuotes = Array(quotes.reversed())
        let departureTimes = flippedQuotes.map(\.legs.first?.departure.scheduled)
        for (index, departureTime) in departureTimes.enumerated() {
            if departureTime ?? .distantFuture < date { return flippedQuotes[index] }
        }
        return nil
    }
    
    func quoteDeparting(at date: Date) -> Quote? {
        let departureTimes = quotes.map(\.legs.first?.departure.scheduled)
        for (index, departureTime) in departureTimes.enumerated() {
            if departureTime ?? .distantPast == date { return quotes[index] }
        }
        return nil
    }
}

extension Trip {
    mutating func trimStops(before: Date, after: Date) {
        route = route.compactMap {
            if $0.departure.scheduled >= before && $0.arrival.scheduled <= after { return $0 } else { return nil }
        }
    }
}

extension TripViewModel {
    enum DateContext {
        case before, after, at
    }
}
