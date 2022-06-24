//
//  EventsViewController.swift
//  StreamingApp
//
//  Created by Kuda Zata on 24/6/2022.
//

import UIKit

class EventsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    //MARK: - Tableview functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell") as! EventTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}
