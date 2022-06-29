//
//  ScheduleViewController.swift
//  StreamingApp
//
//  Created by Kuda Zata on 24/6/2022.
//

import UIKit
import Combine
import SVProgressHUD

class ScheduleViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var schedulesViewModel = SchedulesViewModel()
    var anyCancellable = Set<AnyCancellable>()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBinder()
        setupTimer()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if schedulesViewModel.schedules.value.count == 0 {
            showProgressHUD()
            getSchedule()
        }
    }
    
    //MARK: - Setup binder and timer
    func setupBinder() {
        schedulesViewModel.schedules.sink { [unowned self] _ in
            self.tableView.reloadData()
            if self.schedulesViewModel.schedules.value.count > 0 {
                SVProgressHUD.dismiss()
            }
        }.store(in: &anyCancellable)
    }
    
    func setupTimer() {
        Timer.publish(every: 10, on: .main, in: .default)
            .autoconnect()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.getSchedule()
            }
            .store(in: &anyCancellable)
    }
    
    //MARK: - Tableview functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        schedulesViewModel.schedules.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "scheduleCell") as! ScheduleTableViewCell
        cell.configureCell(schedule: schedulesViewModel.schedules.value[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    
    //MARK: - Network functions
    func getSchedule() {
        schedulesViewModel.getSchedules()
    }
}
