//
//  EventsListViewControllerTests.swift
//  StreamingAppTests
//
//  Created by Kuda Zata on 29/9/2022.
//

import XCTest
@testable import StreamingApp

class EventsListViewControllerTests: XCTestCase {
    
    private var sut: EventsListViewController!
    private var eventsListViewModel: EventsListViewModel!
    private var event1: Event!
    private var event2: Event!

    override func setUpWithError() throws {
        
        sut = UIStoryboard(name: "Events", bundle: nil).instantiateViewController(withIdentifier: "eventsVC") as? EventsListViewController
        _ = sut.view
        
        event1 = Event(id: "1", title: "Man City vs Arsenal", subtitle: "Champions League", date: Date(), imageUrl: "www.image.com", videoUrl: "www.video.com")
        event2 = Event(id: "2", title: "Man Utd vs Liverpool", subtitle: "Premier League", date: Date(), imageUrl: "www.image.com", videoUrl: "www.video.com")
        
        
    }

    override func tearDownWithError() throws {
        sut = nil
        eventsListViewModel = nil
        event1 = nil
        event2 = nil
    }
    
    
    func testTableView_shouldReturnCorrectNumberOfSections() {
        XCTAssertEqual(sut.tableView.numberOfSections, 1)
    }
    
  
    func testTableView_shouldReturnCorrectNumberOfRows() {
        sut.eventsListViewModel.events = [event1, event2]
        sut.tableView.reloadData()
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 2)
    }

}
