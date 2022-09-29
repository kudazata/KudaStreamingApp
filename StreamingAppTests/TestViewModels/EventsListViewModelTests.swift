//
//  EventsListViewModelTests.swift
//  StreamingAppTests
//
//  Created by Kuda Zata on 29/9/2022.
//

import XCTest
@testable import StreamingApp

class EventsListViewModelTests: XCTestCase {
    
    private var sut: EventsListViewModel!
    private var eventsServiceMock: EventsNetworkServiceMock!

    override func setUpWithError() throws {
        eventsServiceMock = EventsNetworkServiceMock(shouldReturnError: false)
        sut = EventsListViewModel(eventsNetworkService: eventsServiceMock)
    }

    override func tearDownWithError() throws {
        eventsServiceMock = nil
        sut = nil
    }
    
    func testInit_EventsCountShouldReturnZero() {
        XCTAssertEqual(sut.events.count, 0)
    }
    
    func testSuccessfulGetEvents_ShouldReturnEventsCountGreaterThanZero() {
        sut.getEvents()
        XCTAssertGreaterThan(sut.events.count, 0)
    }
    
    func testUnsuccessfulGetEvents_EventsCountShouldReturnZero() {
        eventsServiceMock.shouldReturnError = true
        sut = EventsListViewModel(eventsNetworkService: eventsServiceMock)
        sut.getEvents()
        XCTAssertEqual(sut.events.count, 0)
    }

    func testNumberOfSections_ShouldReturnOne() {
        XCTAssertEqual(sut.numberOfSections, 1)
    }
    
    func testNumberOfRowsInSection_ShouldReturnEventsCount() {
        sut.getEvents()
        XCTAssertEqual(sut.numberOfRowsInSection(0), 2)
    }
    
    func testEventAtIndex_ShoudReturnCorrectEvent() {
        
        sut.getEvents()
        let eventVM = sut.eventAtIndex(0)
        
        XCTAssertEqual(eventVM.title, sut.events[0].title)
        XCTAssertEqual(eventVM.subtitle, sut.events[0].subtitle)
        
    }

    
}
