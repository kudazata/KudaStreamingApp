//
//  EventViewModelTests.swift
//  StreamingAppTests
//
//  Created by Kuda Zata on 29/9/2022.
//

import XCTest
@testable import StreamingApp

class EventViewModelTests: XCTestCase {
    
    private var eventViewModel: EventViewModel!
    private var event: Event!

    override func setUpWithError() throws {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        let eventDate = dateFormatter.date(from: "2022-09-29T00:38:08.978Z")
        
        event = Event(id: "1",
                          title: "Man City vs Arsenal",
                          subtitle: "Champions League",
                          date: eventDate!,
                          imageUrl: "www.image.com",
                          videoUrl: "www.video.com")
        
        eventViewModel = EventViewModel(event)
    }

    override func tearDownWithError() throws {
        eventViewModel = nil
        event = nil
    }
    
    func testTitle_ShouldReturnCorrectValue() {
        XCTAssertEqual(eventViewModel.title, "Man City vs Arsenal")
    }
    
    func testSubtitle_ShouldReturnCorrectValue() {
        XCTAssertEqual(eventViewModel.subtitle, "Champions League")
    }
    
    ///This test uses a relative date formatter so will fail if incorrect date is input
    /*func testDate_ShouldReturnCorrectValueAndCorrectFormat() {
        XCTAssertEqual(eventViewModel.date, "Today, 12:38 AM")
    }*/
    
    func testImageUrl_ShouldReturnCorrectValue() {
        XCTAssertEqual(eventViewModel.imageUrl, "www.image.com")
    }
    
    func testVideoUrl_ShouldReturnCorrectValue() {
        XCTAssertEqual(eventViewModel.videoUrl, "www.video.com")
    }

}
