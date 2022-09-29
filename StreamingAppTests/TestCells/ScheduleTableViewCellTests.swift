//
//  ScheduleTableViewCellTests.swift
//  StreamingAppTests
//
//  Created by Kuda Zata on 29/9/2022.
//

import XCTest
@testable import StreamingApp

class ScheduleTableViewCellTests: XCTestCase {

    var tableView: UITableView!
    var sut: ScheduleTableViewCell!
    
    override func setUpWithError() throws {
        let scheduleVC = UIStoryboard(name: "Schedule", bundle: nil).instantiateViewController(withIdentifier: "scheduleVC") as! ScheduleListViewController
        _ = scheduleVC.view
        tableView = scheduleVC.tableView
        sut = tableView.dequeueReusableCell(withIdentifier: "scheduleCell") as? ScheduleTableViewCell
        
    }

    override func tearDownWithError() throws {
        tableView = nil
        sut = nil
    }
    
    func testCell_ShouldConfigureWithScheduleData() {
        
        let schedule = Schedule(id: "1",
                                title: "Liverpool vs Newcastle",
                                subtitle: "FA Cup",
                                date: Date(),
                                imageUrl: "www.image.com")
        
        let scheduleVM = ScheduleViewModel(schedule)
        
        sut.configureCell(scheduleVM: scheduleVM)
        
        XCTAssertEqual(sut.titleLabel.text, schedule.title)
        XCTAssertEqual(sut.subtitleLabel.text, schedule.subtitle)
    }

}
