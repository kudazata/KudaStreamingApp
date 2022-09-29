//
//  ScheduleViewModelTests.swift
//  StreamingAppTests
//
//  Created by Kuda Zata on 29/9/2022.
//

import XCTest
@testable import StreamingApp

class ScheduleViewModelTests: XCTestCase {
    
    private var scheduleViewModel: ScheduleViewModel!
    private var schedule: Schedule!

    override func setUpWithError() throws {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        let scheduleDate = dateFormatter.date(from: "2022-09-29T00:38:08.978Z")
        
        schedule = Schedule(id: "1",
                            title: "Liverpool vs Newcastle",
                            subtitle: "FA Cup",
                            date: scheduleDate!,
                            imageUrl: "www.image.com")
        
        scheduleViewModel = ScheduleViewModel(schedule)
        
    }

    override func tearDownWithError() throws {
        scheduleViewModel = nil
        schedule = nil
    }
    
    func testTitle_ShouldReturnCorrectValue() {
        XCTAssertEqual(scheduleViewModel.title, schedule.title)
    }
    
    func testSubtitle_ShouldReturnCorrectValue() {
        XCTAssertEqual(scheduleViewModel.subtitle, schedule.subtitle)
    }
    
    ///This test uses a relative date formatter so will fail if incorrect date is input
    /*func testDate_ShouldReturnCorrectValueAndCorrectFormat() {
        XCTAssertEqual(scheduleViewModel.date, "Today, 12:38 AM")
    }*/
    
    func testImageUrl_ShouldReturnCorrectValue() {
        XCTAssertEqual(scheduleViewModel.imageUrl, schedule.imageUrl)
    }
    
}
