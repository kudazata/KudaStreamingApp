//
//  EventsViewController.swift
//  StreamingApp
//
//  Created by Kuda Zata on 24/6/2022.
//

import UIKit
import SVProgressHUD
import AVKit

class EventsListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, EventsDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var eventsViewModel = EventsListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        eventsViewModel.eventsDelegate = self
        eventsViewModel.getEvents()
    }
    
    
    //MARK: - Delegate functions
    func didFetchEvents() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func errorFetchingEvents(error: NetworkError) {
        print(error.localizedDescription)
    }
    
 
    //MARK: - Tableview functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventsViewModel.numberOfRowsInSection(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell") as! EventTableViewCell
        let eventVM = eventsViewModel.eventAtIndex(indexPath.row)
        cell.configureCell(eventVM: eventVM)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let eventVM = eventsViewModel.eventAtIndex(indexPath.row)
        let url = URL(string: eventVM.videoUrl)
        let avPlayer = AVPlayer(url: url!)
        avPlayer.play()
        let avController = AVPlayerViewController()
        avController.player = avPlayer
        present(avController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }

}
