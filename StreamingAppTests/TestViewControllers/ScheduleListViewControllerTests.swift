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
    private var scheduleListViewModel: ScheduleListViewModel!
    private var schedule1: Schedule!
    private var schedule2: Schedule!
    

    override func setUpWithError() throws {
        sut = UIStoryboard(name: "Schedule", bundle: nil).instantiateViewController(withIdentifier: "scheduleVC") as? ScheduleListViewController
        _ = sut.view
        
        schedule1 = Schedule(id: "1", title: "Chelsea vs Newcastle", subtitle: "FA Cup", date: Date(), imageUrl: "www.image1.com")
        
        schedule2 = Schedule(id: "2", title: "Barcelona vs Real Madrid", subtitle: "La Liga", date: Date(), imageUrl: "www.image2.com")
    }

    override func tearDownWithError() throws {
        sut = nil
        scheduleListViewModel = nil
        schedule1 = nil
        schedule2 = nil
    }
    
    func testTableView_shouldReturnCorrectNumberOfSections() {
        XCTAssertEqual(sut.tableView.numberOfSections, 1)
    }
    
  
    func testTableView_shouldReturnCorrectNumberOfRows() {
        sut.scheduleListViewModel.schedules = [schedule1, schedule2]
        sut.tableView.reloadData()
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 2)
    }


}
