//
//  ScheduleListViewControllerTests.swift
//  StreamingAppTests
//
//  Created by Kuda Zata on 29/9/2022.
//

import XCTest
@testable import StreamingApp

class ScheduleListViewControllerTests: XCTestCase {
    
    private var sut: ScheduleListViewController!

    override func setUpWithError() throws {
        sut = UIStoryboard(name: "Schedule", bundle: nil).instantiateViewController(withIdentifier: "scheduleVC") as? ScheduleListViewController
        sut.schedulesNetworkService = SchedulesNetworkServiceMock()
        _ = sut.view
        
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testTableView_shouldReturnCorrectNumberOfSections() {
        XCTAssertEqual(sut.tableView.numberOfSections, 1)
    }
    
  
    func testTableView_shouldReturnCorrectNumberOfRows() {
        sut.scheduleListViewModel.getSchedules()
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 2)
    }

}
