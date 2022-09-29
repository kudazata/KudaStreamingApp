//
//  EventsViewController.swift
//  StreamingApp
//
//  Created by Kuda Zata on 24/6/2022.
//

import UIKit
import AVKit

class EventsListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, EventsDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    let eventsListViewModel = EventsListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        eventsListViewModel.eventsDelegate = self
        eventsListViewModel.getEvents()
    }
    
    
    //MARK: - Delegate functions
    func didFetchEvents() {
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
            self.tableView.reloadData()
        }
    }
    
    func errorFetchingEvents(error: NetworkError) {
        
        var errorMessage = ""
    
        switch error {
        case .customError(let customError):
            errorMessage = customError.localizedDescription
        default:
            errorMessage = error.localizedDescription
        }
        
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
            showRetryAlert(title: "Network error", message: errorMessage, vc: self) {
                self.activityIndicator.startAnimating()
                self.eventsListViewModel.getEvents()
            }
        }
    }
    
 
    //MARK: - Tableview functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventsListViewModel.numberOfRowsInSection(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell") as! EventTableViewCell
        let eventVM = eventsListViewModel.eventAtIndex(indexPath.row)
        cell.configureCell(eventVM: eventVM)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let eventVM = eventsListViewModel.eventAtIndex(indexPath.row)
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
