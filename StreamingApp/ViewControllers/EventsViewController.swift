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
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if eventsViewModel.events.count == 0 {
            showProgressHUD()
            getEvents()
        }
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let url = URL(string: eventsViewModel.events[indexPath.row].videoUrl!)
        let avPlayer = AVPlayer(url: url!)
        avPlayer.play()
        let avController = AVPlayerViewController()
        avController.player = avPlayer
        present(avController, animated: true)
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
                if (self?.eventsViewModel.events.count)! > 0 {
                    SVProgressHUD.dismiss()
                }
            }
            .store(in: &anyCancellable)
    }
}

extension UIViewController {
    func showProgressHUD() {
        
        //Customizing SVProgressHUD
        view.endEditing(true)
        SVProgressHUD.setRingThickness(6)
        SVProgressHUD.setDefaultMaskType(.black)
        SVProgressHUD.setForegroundColor(UIColor.white)
        SVProgressHUD.setBackgroundColor(.clear)
        SVProgressHUD.show()
    }
}
