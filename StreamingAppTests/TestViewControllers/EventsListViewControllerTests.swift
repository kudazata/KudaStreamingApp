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

    override func setUpWithError() throws {
        
        sut = UIStoryboard(name: "Events", bundle: nil).instantiateViewController(withIdentifier: "eventsVC") as? EventsListViewController
        sut.eventsNetworkService = EventsNetworkServiceMock()
        _ = sut.view
        
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    
    func testTableView_shouldReturnCorrectNumberOfSections() {
        XCTAssertEqual(sut.tableView.numberOfSections, 1)
    }
    
  
    func testTableView_shouldReturnCorrectNumberOfRows() {
        sut.eventsListViewModel.getEvents()
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 2)
    }

}
