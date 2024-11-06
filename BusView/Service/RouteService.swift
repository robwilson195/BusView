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
}

class RouteService: RouteServicing {
    
    func getQuotes() async throws -> QuoteResponse {
        guard let url = URL(string: Constants.quotesTodayEndpoint) else { throw ServiceError.invalidURL }
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(QuoteResponse.self, from: data)
    }
    
    func getTrip(id: String) async throws -> Trip {
        guard let url = URL(string: Constants.tripsEndpoint(id: id)) else { throw ServiceError.invalidURL }
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(Trip.self, from: data)
    }
}

enum ServiceError: Error {
    case invalidURL
}
