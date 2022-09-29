//
//  ScheduleTableViewCellTests.swift
//  StreamingAppTests
//
//  Created by Kuda Zata on 29/9/2022.
//

import XCTest
@testable import StreamingApp

class ScheduleTableViewCellTests: XCTestCase {

    private var tableView: UITableView!
    private var sut: ScheduleTableViewCell!
    private var schedulesServiceMock: SchedulesNetworkServiceMock!
    private var scheduleVC: ScheduleListViewController!
    
    override func setUpWithError() throws {
        scheduleVC = UIStoryboard(name: "Schedule", bundle: nil).instantiateViewController(withIdentifier: "scheduleVC") as? ScheduleListViewController
        schedulesServiceMock = SchedulesNetworkServiceMock(shouldReturnError: false)
        scheduleVC.schedulesNetworkService = schedulesServiceMock
        _ = scheduleVC.view
        tableView = scheduleVC.tableView
        sut = tableView.dequeueReusableCell(withIdentifier: "scheduleCell") as? ScheduleTableViewCell
    }

    override func tearDownWithError() throws {
        tableView = nil
        sut = nil
        schedulesServiceMock = nil
        scheduleVC = nil
    }
    
    func testCell_ShouldConfigureWithScheduleData() {
        
        let schedule = scheduleVC.scheduleListViewModel.schedules[0]
        let scheduleVM = ScheduleViewModel(schedule)
        sut.configureCell(scheduleVM: scheduleVM)
        
        XCTAssertEqual(sut.titleLabel.text, schedule.title)
        XCTAssertEqual(sut.subtitleLabel.text, schedule.subtitle)
    }

}
