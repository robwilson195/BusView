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
    
    private let decoder: JSONDecoder = {
        let temp = JSONDecoder()
        temp.dateDecodingStrategy = .iso8601
        return temp
    }()
    
    func getQuotes() async throws -> QuoteResponse {
        guard let url = URL(string: Constants.quotesTodayEndpoint) else { throw ServiceError.invalidURL }
        let (data, response) = try await URLSession.shared.data(from: url)
        do {
            let quoteResponse = try decoder.decode(QuoteResponse.self, from: data)
            return quoteResponse
        } catch {
            throw error
        }
        
    }
    
    func getTrip(id: String) async throws -> Trip {
        guard let url = URL(string: Constants.tripsEndpoint(id: id)) else { throw ServiceError.invalidURL }
        let (data, response) = try await URLSession.shared.data(from: url)
        do {
            let trip = try decoder.decode(Trip.self, from: data)
            return trip
        } catch {
            throw error
        }
    }
}

enum ServiceError: Error {
    case invalidURL
}
