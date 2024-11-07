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
    case loaded(activeTrip: Trip)
}

enum ProcessingError: Error {
    case noMoreTripsToday
    case noEarlierTrips
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
            let quotesResponse = try await routeService.getQuotes()
            cachedQuotes = quotesResponse
            guard let soonestLeg = quotesResponse.soonestLeg(after: Date.now) else {
                throw ProcessingError.noMoreTripsToday
            }
            let scheduledDeparture = soonestLeg.departure.scheduled
            let scheduledArrival = soonestLeg.arrival.scheduled
            var trip = try await routeService.getTrip(id: soonestLeg.tripUid)
            trip.trimStops(before: scheduledDeparture, after: scheduledArrival)
            viewState = .loaded(activeTrip: trip)
        } catch {
            viewState = .error(error)
        }
    }
    
    @MainActor
    func onPreviousTapped() async {
        do {
            guard case .loaded(let trip) = viewState,
                  let cachedQuotes,
                  let currentDeparture = trip.route.first?.departure.scheduled,
                  let previousLeg = cachedQuotes.mostRecentLeg(before: currentDeparture) else {
                throw ProcessingError.noEarlierTrips
            }
            let scheduledDeparture = previousLeg.departure.scheduled
            let scheduledArrival = previousLeg.arrival.scheduled
            var previousTrip = try await routeService.getTrip(id: previousLeg.tripUid)
            previousTrip.trimStops(before: scheduledDeparture, after: scheduledArrival)
            viewState = .loaded(activeTrip: previousTrip)
        } catch {
            viewState = .error(error)
        }
    }
    
    @MainActor
    func onNextTapped() async {
        do {
            guard case .loaded(let trip) = viewState,
                  let cachedQuotes,
                  let currentDeparture = trip.route.first?.departure.scheduled,
                  let nextLeg = cachedQuotes.soonestLeg(after: currentDeparture) else {
                throw ProcessingError.noMoreTripsToday
            }
            let scheduledDeparture = nextLeg.departure.scheduled
            let scheduledArrival = nextLeg.arrival.scheduled
            var nextTrip = try await routeService.getTrip(id: nextLeg.tripUid)
            nextTrip.trimStops(before: scheduledDeparture, after: scheduledArrival)
            viewState = .loaded(activeTrip: nextTrip)
        } catch {
            viewState = .error(error)
        }
    }
    
    @MainActor
    func onRefreshTapped() async {
        do {
            guard case .loaded(let currentTrip) = viewState,
                  !currentTrip.route.isEmpty else {
                throw ProcessingError.generic
            }
            let scheduledDeparture = currentTrip.route.first!.departure.scheduled
            let scheduledArrival = currentTrip.route.last!.arrival.scheduled
            var refreshedTrip = try await routeService.refreshRecentTrip()
            refreshedTrip.trimStops(before: scheduledDeparture, after: scheduledArrival)
            viewState = .loaded(activeTrip: refreshedTrip)
        } catch {
            viewState = .error(error)
        }
    }
}


extension QuoteResponse {
    func soonestLeg(after date: Date) -> Leg? {
        let firstLegs = quotes.map(\.legs.first)
        let departureTimes = firstLegs.map { $0?.departure.scheduled }
        for (index, departureTime) in departureTimes.enumerated() {
            if departureTime ?? .distantPast > date { return firstLegs[index] }
        }
        return nil
    }
    
    func mostRecentLeg(before date: Date) -> Leg? {
        let firstLegs = quotes.map(\.legs.first)
        let flipped = Array(firstLegs.reversed())
        let departureTimes = flipped.map { $0?.departure.scheduled }
        for (index, departureTime) in departureTimes.enumerated() {
            if departureTime ?? .distantFuture < date { return flipped[index] }
        }
        return nil
    }
}

extension Trip {
    mutating func trimStops(before: Date, after: Date) {
        route = route.compactMap {
            if $0.departure.scheduled >= before && $0.arrival.scheduled <= after { return $0 } else { return nil}
        }
    }
}
