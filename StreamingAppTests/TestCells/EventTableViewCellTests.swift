//
//  EventTableViewCellTests.swift
//  StreamingAppTests
//
//  Created by Kuda Zata on 29/9/2022.
//

import XCTest
@testable import StreamingApp

class EventTableViewCellTests: XCTestCase {
    
    private var tableView: UITableView!
    private var sut: EventTableViewCell!
    private var eventsServiceMock: EventsNetworkServiceMock!
    private var eventsListVC: EventsListViewController!

    override func setUpWithError() throws {
        eventsListVC = UIStoryboard(name: "Events", bundle: nil).instantiateViewController(withIdentifier: "eventsVC") as? EventsListViewController
        eventsServiceMock = EventsNetworkServiceMock(shouldReturnError: false)
        eventsListVC.eventsNetworkService = eventsServiceMock
        _ = eventsListVC.view
        tableView = eventsListVC.tableView
        sut = tableView.dequeueReusableCell(withIdentifier: "eventCell") as? EventTableViewCell
    }

    override func tearDownWithError() throws {
        tableView = nil
        sut = nil
        eventsServiceMock = nil
        eventsListVC = nil
    }

    func testCell_ShouldConfigureWithEventObject() {
        let event = eventsListVC.eventsListViewModel.events[0]
        
        let eventViewModel = EventViewModel(event)
        
        sut.configureCell(eventVM: eventViewModel)
        
        XCTAssertEqual(sut.titleLabel.text, event.title)
        XCTAssertEqual(sut.subtitleLabel.text, event.subtitle)
        
    }

}
