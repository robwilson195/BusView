//
//  TripTests.swift
//  BusViewTests
//
//  Created by Catherine Megregian on 11/11/2024.
//

@testable import BusView
import XCTest

final class TripTests: XCTestCase {
    
    private var sut: Trip!
    
    override func setUp() {
        sut = TripJSONData.tripResponse
    }
    
    override func tearDown() {
        sut = nil
    }
    
    func test_correctNumberOfStops() {
        XCTAssertEqual(sut.route.count, 27)
    }
    
    func test_trimStops() throws {
        let startTime = eleventhNovemberDateFrom(hour: 9, minute: 20)
        let endTime = eleventhNovemberDateFrom(hour: 11, minute: 08)
        sut.trimStops(before: startTime, after: endTime)
        let firstStop = try XCTUnwrap(sut.route.first)
        let lastStop = try XCTUnwrap(sut.route.last)
        XCTAssertEqual(sut.route.count, 8)
        XCTAssertEqual(lastStop.id, 1374048)
        XCTAssertEqual(firstStop.id, 1374051)
    }
    
    func test_stopTimingText_arriving() throws {
        let previousStop = try XCTUnwrap(sut.route.first)
        let previousStopText = previousStop.timingText(timingType: .arriving)
        XCTAssertEqual(previousStopText, "Arrived at 7:10")
        let futureStop = try XCTUnwrap(sut.route.last)
        let futureStopText = futureStop.timingText(timingType: .arriving)
        XCTAssertEqual(futureStopText, "Arriving at 11:26")
    }
    
    
    func test_stopTimingText_departing() throws {
        let previousStop = try XCTUnwrap(sut.route.first)
        let previousStopText = previousStop.timingText(timingType: .departing)
        XCTAssertEqual(previousStopText, "Departed at 7:17")
        let futureStop = try XCTUnwrap(sut.route.last)
        let futureStopText = futureStop.timingText(timingType: .departing)
        XCTAssertEqual(futureStopText, "Departing at 11:26")
    }
}
