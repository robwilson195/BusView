//
//  RouteServiceMock.swift
//  BusViewTests
//
//  Created by Catherine Megregian on 11/11/2024.
//

@testable import BusView
import Foundation

class RouteServiceMock: RouteServicing {
    private let quoteResponse = QuoteResponseJSON.quoteResponse
    private let tripResponse = TripJSONData.tripResponse
    var quoteError: Error?
    var tripError: Error?
    
    var getQuotesCallCount = 0
    func getQuotes() async throws -> QuoteResponse {
        getQuotesCallCount += 1
        if let error = quoteError {
            throw error
        } else {
            return quoteResponse
        }
    }
    
    var getTripCallCount = 0
    var getTripIds = [String]()
    func getTrip(id: String) async throws -> Trip {
        getTripIds.append(id)
        getTripCallCount += 1
        if let error = tripError {
            throw error
        } else {
            return tripResponse
        }
    }
}
