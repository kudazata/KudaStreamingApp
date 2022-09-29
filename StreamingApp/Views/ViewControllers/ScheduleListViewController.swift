//
//  ScheduleViewController.swift
//  StreamingApp
//
//  Created by Kuda Zata on 24/6/2022.
//

import UIKit

class ScheduleListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, SchedulesDelegate {
    
    let scheduleListViewModel = ScheduleListViewModel()
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scheduleListViewModel.schedulesDelegate = self
        scheduleListViewModel.getSchedules()
        scheduleListViewModel.setupTimer()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    
    //MARK: - Delegate functions
    func didFetchSchedules() {
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
            self.tableView.reloadData()
        }
    }
    
    func errorFetchingSchedules(error: NetworkError) {
        
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
                self.scheduleListViewModel.getSchedules()
            }
        }
    }
   
    //MARK: - Tableview functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        scheduleListViewModel.numberOfRowsInSection(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "scheduleCell") as! ScheduleTableViewCell
        let scheduleVM = scheduleListViewModel.scheduleAtIndex(indexPath.row)
        cell.configureCell(scheduleVM: scheduleVM)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
}
