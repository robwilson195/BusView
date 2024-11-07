//
//  RouteService.swift
//  BusView
//
//  Created by Catherine Megregian on 06/11/2024.
//

import Foundation

protocol RouteServicing {
    func getQuotes() async throws -> QuoteResponse
    func getTrip(id: String) async throws -> Trip
    func refreshRecentTrip() async throws -> Trip
}

class RouteService: RouteServicing {
    
    private var recentTripId: String?
    private let decoder: JSONDecoder = {
        let temp = JSONDecoder()
        temp.dateDecodingStrategy = .iso8601
        return temp
    }()
    
    func getQuotes() async throws -> QuoteResponse {
        guard let url = URL(string: Constants.quotesTodayEndpoint) else { throw ServiceError.invalidURL }
        let (data, _) = try await URLSession.shared.data(from: url)
        return try decoder.decode(QuoteResponse.self, from: data)
        
    }
    
    func getTrip(id: String) async throws -> Trip {
        guard let url = URL(string: Constants.tripsEndpoint(id: id)) else { throw ServiceError.invalidURL }
        let (data, _) = try await URLSession.shared.data(from: url)
        let trip = try decoder.decode(Trip.self, from: data)
        recentTripId = id
        return trip
    }
    
    func refreshRecentTrip() async throws -> Trip {
        guard let recentTripId else { throw ServiceError.noRecentTripId }
        return try await getTrip(id: recentTripId)
    }
}

enum ServiceError: Error {
    case invalidURL
    case noRecentTripId
}
