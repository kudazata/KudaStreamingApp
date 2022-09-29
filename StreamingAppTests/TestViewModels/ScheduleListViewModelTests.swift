//
//  ScheduleListViewModelTests.swift
//  StreamingAppTests
//
//  Created by Kuda Zata on 29/9/2022.
//

import XCTest
@testable import StreamingApp

class ScheduleListViewModelTests: XCTestCase {
    
    private var sut: ScheduleListViewModel!
    private var schedulesServiceMock: SchedulesNetworkServiceMock!

    override func setUpWithError() throws {
        schedulesServiceMock = SchedulesNetworkServiceMock(shouldReturnError: false)
        sut = ScheduleListViewModel(schedulesNetworkService: schedulesServiceMock)
    }

    override func tearDownWithError() throws {
        sut = nil
        schedulesServiceMock = nil
    }
    
    func testInit_EventsCountShouldReturnZero() {
        XCTAssertEqual(sut.schedules.count, 0)
    }
    
    func testSuccessfulGetSchedules_ShouldReturnSchedulesCountGreaterThanZero() {
        sut.getSchedules()
        XCTAssertGreaterThan(sut.schedules.count, 0)
    }
    
    func testUnsuccessfulGetEvents_EventsCountShouldReturnZero() {
        schedulesServiceMock.shouldReturnError = true
        sut = ScheduleListViewModel(schedulesNetworkService: schedulesServiceMock)
        sut.getSchedules()
        XCTAssertEqual(sut.schedules.count, 0)
    }
    
    func testNumberOfSections_ShouldReturnOne() {
        XCTAssertEqual(sut.numberOfSections, 1)
    }

    func testNumberOfRowsInSection_ShouldReturnSchedulesCount() {
        
        sut.getSchedules()
        XCTAssertEqual(sut.numberOfRowsInSection(0), 2)
    }
    
    func testScheduleAtIndex_ShoudReturnCorrectSchedule() {
        
        sut.getSchedules()
        let scheduleVM = sut.scheduleAtIndex(0)
        
        XCTAssertEqual(scheduleVM.title, sut.schedules[0].title)
        XCTAssertEqual(scheduleVM.subtitle, sut.schedules[0].subtitle)
        
    }

}
