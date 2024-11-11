//
//  TripViewModelTests.swift
//  BusViewTests
//
//  Created by Catherine Megregian on 11/11/2024.
//

@testable import BusView
import XCTest
import Combine

final class TripViewModelTests: XCTestCase {
    
    private var sut: TripViewModel!
    private var routeService: RouteServiceMock!
    private var subscriptions: Set<AnyCancellable> = []
    
    override func setUp() {
        routeService = .init()
        sut = .init(routeService: routeService)
        subscriptions = []
    }
    
    override func tearDown() {
        sut = nil
        routeService = nil
    }
    
    func test_whenViewAppears_thenLoadingShownAndServiceCalled() async {
        // Given
        var viewWasLoading = false
        sut.$viewState.sink { viewState in
            if case .loading = viewState {
                viewWasLoading = true
            }
        }.store(in: &subscriptions)
        let date = eleventhNovemberDateFrom(hour: 9, minute: 20)
        
        // When
        await sut.onViewAppear(time: date)
        
        // Then
        XCTAssertTrue(viewWasLoading)
        XCTAssertEqual(routeService.getQuotesCallCount, 1)
        XCTAssertEqual(routeService.getTripCallCount, 1)
    }
    
    func test_givenQuoteRefreshFails_whenViewAppears_thenErrorStateShown() async {
        // Given
        routeService.quoteError = ServiceError.invalidURL
        let date = eleventhNovemberDateFrom(hour: 9, minute: 20)
        
        // When
        await sut.onViewAppear(time: date)
        
        // Then
        switch sut.viewState {
        case let .error(error):
            XCTAssertEqual(error as? ServiceError, ServiceError.invalidURL)
        default: XCTFail()
        }
    }
    
    func test_givenTripRequestFails_whenViewAppears_thenErrorStateShown() async {
        // Given
        routeService.tripError = ServiceError.invalidURL
        let date = eleventhNovemberDateFrom(hour: 9, minute: 20)
        
        // When
        await sut.onViewAppear(time: date)
        
        // Then
        switch sut.viewState {
        case let .error(error):
            XCTAssertEqual(error as? ServiceError, ServiceError.invalidURL)
        default: XCTFail()
        }
    }
    
    func test_givenNoMoreTrips_whenViewAppears_thenNoMoreTripsErrorShown() async {
        // Given
        let date = eleventhNovemberDateFrom(hour: 23, minute: 59)
        
        // When
        await sut.onViewAppear(time: date)
        
        // then
        switch sut.viewState {
        case let .error(error):
            XCTAssertEqual(error as? TripProcessingError, .noTrips)
        default:
            XCTFail()
        }
    }
    
    func test_givenRequestsSucceedAndFutureTrip_whenViewAppears_thenLoadedStateShown() async throws {
        // Given
        let date = eleventhNovemberDateFrom(hour: 9, minute: 20)
        
        // When
        await sut.onViewAppear(time: date)
        
        // Then
        switch sut.viewState {
        case let .loaded(trip, quote):
            let quotedLegId = try XCTUnwrap(quote.legs.first?.tripUid)
            XCTAssertEqual(quotedLegId, "6EcqQbd5DdKUaDx8LceQWd")
            let firstStop = try XCTUnwrap(trip.route.first)
            XCTAssertEqual(firstStop.id, 1374051)
            XCTAssertEqual(firstStop.timingText(timingType: .departing), "Departed at 9:30")
        default: XCTFail()
        }
    }
}
