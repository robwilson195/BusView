//
//  Models+Utitlity.swift
//  BusView
//
//  Created by Catherine Megregian on 11/11/2024.
//

import Foundation

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
    
    var alreadyLeft: Bool {
        route.first?.departure.actual != nil
    }
}

extension Stop {
    enum TimingType {
        case departing, arriving
        var futureTensePrefix: String {
            switch self {
            case .departing:
                "Departing at "
            case .arriving:
                "Arriving at "
            }
        }
        var pastTensePrefix: String {
            switch self {
            case .departing:
                "Departed at "
            case .arriving:
                "Arrived at "
            }
        }
        var stopKeyPath: KeyPath<Stop, Timings> {
            switch self {
            case .departing:
                \.departure
            case .arriving:
                \.arrival
            }
        }
    }
    
    func timingText(timingType: TimingType) -> String {
        let text = self[keyPath: timingType.stopKeyPath].actual == nil ? timingType.futureTensePrefix : timingType.pastTensePrefix
        if let actual = self[keyPath: timingType.stopKeyPath].actual {
            return text.appending(actual.shortenedTime())
        } else if let estimated = self[keyPath: timingType.stopKeyPath].estimated {
            return text.appending(estimated.shortenedTime())
        } else {
            return text.appending(self[keyPath: timingType.stopKeyPath].scheduled.shortenedTime())
        }
    }
}
