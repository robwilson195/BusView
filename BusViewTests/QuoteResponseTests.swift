//
//  QuoteResponseTests.swift
//  BusViewTests
//
//  Created by Rob Wilson on 06/11/2024.
//

@testable import BusView
import XCTest

final class QuoteResponseTests: XCTestCase {
    
    private var sut = QuoteResponseJSON.quoteResponse
    
    func test_correctNumberOfQuotes() {
        XCTAssertEqual(sut.quotes.count, 3)
    }
    
    func test_soonestQuote() throws {
        let date = eleventhNovemberDateFrom(hour: 9, minute: 20)
        let soonestQuote = sut.soonestQuote(after: date)
        let firstLeg = try XCTUnwrap(soonestQuote?.legs.first)
        XCTAssertEqual(firstLeg.tripUid, "6EcqQbd5DdKUaDx8LceQWd")
    }
    
    func test_mostRecentQuote() throws {
        let date = eleventhNovemberDateFrom(hour: 9, minute: 20)
        let soonestQuote = sut.mostRecentQuote(before: date)
        let firstLeg = try XCTUnwrap(soonestQuote?.legs.first)
        XCTAssertEqual(firstLeg.tripUid, "c93gEcCxuQwzzWuYyAX4wQ")
    }
    
    func test_quoteDepartingAt() throws {
        let date = eleventhNovemberDateFrom(hour: 10, minute: 00)
        let quote = sut.quoteDeparting(at: date)
        let firstLeg = try XCTUnwrap(quote?.legs.first)
        XCTAssertEqual(firstLeg.tripUid, "YMidJi5QTjS4Ji5vuK7TCb")
        
    }
}
