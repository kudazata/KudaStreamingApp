//
//  ScheduleViewController.swift
//  StreamingApp
//
//  Created by Kuda Zata on 24/6/2022.
//

import UIKit
import Combine

class ScheduleViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var schedulesViewModel = SchedulesViewModel()
    var anyCancellable = Set<AnyCancellable>()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        getSchedule()
    }
    
    //MARK: - Tableview functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        schedulesViewModel.schedules.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "scheduleCell") as! ScheduleTableViewCell
        schedulesViewModel.$schedules
            .receive(on: DispatchQueue.main)
            .sink { schedules in
                cell.configureCell(schedule: schedules[indexPath.row])
            }
            .store(in: &anyCancellable)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    
    //MARK: - Network functions
    func getSchedule() {
        schedulesViewModel.getSchedules()
        schedulesViewModel.$schedules
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.tableView.reloadData()
            }
            .store(in: &anyCancellable)
    }
}
