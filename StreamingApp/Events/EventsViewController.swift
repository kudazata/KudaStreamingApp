//
//  EventsViewController.swift
//  StreamingApp
//
//  Created by Kuda Zata on 24/6/2022.
//

import UIKit
import Combine

class EventsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var eventsViewModel = EventsViewModel()
    var anyCancellable = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()
        getEvents()
    }
 
    //MARK: - Tableview functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventsViewModel.events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell") as! EventTableViewCell
        eventsViewModel.$events
            .receive(on: DispatchQueue.main)
            .sink { events in
                cell.configureCell(event: events[indexPath.row])
            }
            .store(in: &anyCancellable)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    //MARK: - Network functions
    func getEvents() {
        eventsViewModel.getEvents()
        eventsViewModel.$events
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.tableView.reloadData()
            }
            .store(in: &anyCancellable)
    }
}
