//
//  EventsViewController.swift
//  StreamingApp
//
//  Created by Kuda Zata on 24/6/2022.
//

import UIKit
import Combine
import SVProgressHUD
import AVKit

class EventsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var eventsViewModel = EventsViewModel()
    var anyCancellable = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBinder()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if eventsViewModel.events.value.count == 0 {
            showProgressHUD()
            eventsViewModel.getEvents()
        }
    }
    
    //MARK: - Setup binder
    func setupBinder() {
        eventsViewModel.events.sink { [unowned self] _ in
            DispatchQueue.main.async {
                if self.eventsViewModel.events.value.count > 0 {
                    SVProgressHUD.dismiss()
                }
                self.tableView.reloadData()
            }
        }.store(in: &anyCancellable)
    }
 
    //MARK: - Tableview functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventsViewModel.events.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell") as! EventTableViewCell
        cell.configureCell(event: eventsViewModel.events.value[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let url = URL(string: eventsViewModel.events.value[indexPath.row].videoUrl!)
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
