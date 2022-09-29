//
//  EventsListViewModelTests.swift
//  StreamingAppTests
//
//  Created by Kuda Zata on 29/9/2022.
//

import XCTest
@testable import StreamingApp

class EventsListViewModelTests: XCTestCase {
    
    private var eventsListViewModel: EventsListViewModel!

    override func setUpWithError() throws {
        eventsListViewModel = EventsListViewModel()
    }

    override func tearDownWithError() throws {
        eventsListViewModel = nil
    }

    func testNumberOfSections_ShouldReturnOne() {
        XCTAssertEqual(eventsListViewModel.numberOfSections, 1)
    }
    
    func testNumberOfRowsInSection_ShouldReturnEventsCount() {
        let event1 = Event(id: "1", title: "Man City vs Arsenal", subtitle: "Champions League", date: Date(), imageUrl: "www.image.com", videoUrl: "www.video.com")
        let event2 = Event(id: "2", title: "Man Utd vs Liverpool", subtitle: "Premier League", date: Date(), imageUrl: "www.image.com", videoUrl: "www.video.com")
        
        eventsListViewModel.events = [event1, event2]
        
        XCTAssertEqual(eventsListViewModel.numberOfRowsInSection(0), 2)
    }
    
    func testEventAtIndex_ShoudReturnCorrectEvent() {
        let event1 = Event(id: "1", title: "Man City vs Arsenal", subtitle: "Champions League", date: Date(), imageUrl: "www.image.com", videoUrl: "www.video.com")
        let event2 = Event(id: "1", title: "Man Utd vs Liverpool", subtitle: "Premier League", date: Date(), imageUrl: "www.image.com", videoUrl: "www.video.com")
        eventsListViewModel.events = [event1, event2]
        
        let eventVM = eventsListViewModel.eventAtIndex(0)
        
        XCTAssertEqual(eventVM.title, "Man City vs Arsenal")
        XCTAssertEqual(eventVM.subtitle, "Champions League")
        
    }

    
}
