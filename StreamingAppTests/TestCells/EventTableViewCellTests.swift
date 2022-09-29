//
//  EventTableViewCellTests.swift
//  StreamingAppTests
//
//  Created by Kuda Zata on 29/9/2022.
//

import XCTest
@testable import StreamingApp

class EventTableViewCellTests: XCTestCase {
    
    var tableView: UITableView!
    var sut: EventTableViewCell!

    override func setUpWithError() throws {
        let eventsListVC = UIStoryboard(name: "Events", bundle: nil).instantiateViewController(withIdentifier: "eventsVC") as! EventsListViewController
        _ = eventsListVC.view
        tableView = eventsListVC.tableView
        sut = tableView.dequeueReusableCell(withIdentifier: "eventCell") as? EventTableViewCell
    }

    override func tearDownWithError() throws {
        tableView = nil
        sut = nil
    }

    func testCell_ShouldConfigureWithEventObject() {
        let event = Event(id: "1",
                          title: "Man City vs Arsenal",
                          subtitle: "Champions League",
                          date: Date(),
                          imageUrl: "www.image.com",
                          videoUrl: "www.video.com")
        
        let eventViewModel = EventViewModel(event)
        
        sut.configureCell(eventVM: eventViewModel)
        
        XCTAssertEqual(sut.titleLabel.text, event.title)
        XCTAssertEqual(sut.subtitleLabel.text, event.subtitle)
        
    }

}
