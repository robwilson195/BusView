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
}

class TripViewModel: ObservableObject {
    
    @Published var viewState: TripViewState = .loading
    private let routeService: RouteServicing
    
    init(routeService: RouteServicing) {
        self.routeService = routeService
    }
    
    @MainActor
    func onViewAppear() async {
        do {
            let quotesResponse = try await routeService.getQuotes()
            let firstLegs = quotesResponse.quotes.map(\.legs.first)
            guard let nextLeg = firstLegs.soonest(after: Date.now) else {
                throw ProcessingError.noMoreTripsToday
            }
            let trip = try await routeService.getTrip(id: nextLeg.tripUid)
            viewState = .loaded(activeTrip: trip)
        } catch {
            viewState = .error(error)
        }
    }
}

extension Array where Element == Leg? {
    func soonest(after date: Date) -> Leg? {
        let departureTimes = map { $0?.departure.scheduled }
        for (index, departureTime) in departureTimes.enumerated() {
            if departureTime ?? .distantPast > date { return self[index] }
        }
        return nil
    }
}
