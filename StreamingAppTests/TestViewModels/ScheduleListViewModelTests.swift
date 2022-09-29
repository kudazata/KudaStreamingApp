//
//  ScheduleListViewModelTests.swift
//  StreamingAppTests
//
//  Created by Kuda Zata on 29/9/2022.
//

import XCTest
@testable import StreamingApp

class ScheduleListViewModelTests: XCTestCase {
    
    private var scheduleListViewModel: ScheduleListViewModel!

    override func setUpWithError() throws {
        scheduleListViewModel = ScheduleListViewModel()
    }

    override func tearDownWithError() throws {
        scheduleListViewModel = nil
    }
    
    func testNumberOfSections_ShouldReturnOne() {
        XCTAssertEqual(scheduleListViewModel.numberOfSections, 1)
    }

    func testNumberOfRowsInSection_ShouldReturnSchedulesCount() {
        
        let schedule1 = Schedule(id: "1", title: "Chelsea vs Newcastle", subtitle: "FA Cup", date: Date(), imageUrl: "www.image1.com")
        
        let schedule2 = Schedule(id: "2", title: "Barcelona vs Real Madrid", subtitle: "La Liga", date: Date(), imageUrl: "www.image2.com")
        
        scheduleListViewModel.schedules = [schedule1, schedule2]
        
        XCTAssertEqual(scheduleListViewModel.numberOfRowsInSection(0), 2)
    }
    
    func testScheduleAtIndex_ShoudReturnCorrectSchedule() {
        let schedule1 = Schedule(id: "1", title: "Chelsea vs Newcastle", subtitle: "FA Cup", date: Date(), imageUrl: "www.image1.com")
        
        let schedule2 = Schedule(id: "2", title: "Barcelona vs Real Madrid", subtitle: "La Liga", date: Date(), imageUrl: "www.image2.com")
        
        scheduleListViewModel.schedules = [schedule1, schedule2]
        
        let scheduleVM = scheduleListViewModel.scheduleAtIndex(0)
        
        XCTAssertEqual(scheduleVM.title, "Chelsea vs Newcastle")
        XCTAssertEqual(scheduleVM.subtitle, "FA Cup")
        
    }

}
