//
//  SchedulesViewModel.swift
//  StreamingApp
//
//  Created by Kuda Zata on 27/6/2022.
//

import Foundation

protocol SchedulesDelegate {
    func didFetchSchedules()
    func errorFetchingSchedules(error: NetworkError)
}

class ScheduleListViewModel {
    
    init(schedulesNetworkService: SchedulesNetworkServiceProtocol) {
        self.schedulesNetworkService = schedulesNetworkService
    }
    
    var schedules = [Schedule]()
    private var timer = Timer()
    var schedulesDelegate: SchedulesDelegate?
    var schedulesNetworkService: SchedulesNetworkServiceProtocol?
    
    var numberOfSections: Int {
        return 1
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return schedules.count
    }
    
    func scheduleAtIndex(_ index: Int) -> ScheduleViewModel {
        let schedule = schedules[index]
        return ScheduleViewModel(schedule)
    }
    
    
    func getSchedules() {
        
        schedulesNetworkService?.getSchedules { schedules, error in
            
            if let error = error {
                self.schedulesDelegate?.errorFetchingSchedules(error: error)
                return
            }
            
            if let schedules = schedules {
                self.schedules = schedules.sorted(by: {$0.date.compare($1.date) == .orderedAscending})
                self.schedulesDelegate?.didFetchSchedules()
                return
            }
            else {
                self.schedulesDelegate?.errorFetchingSchedules(error: .decodingError)
            }
        }
        
    }
    
    func setupTimer() {
        self.timer = Timer.scheduledTimer(withTimeInterval: 30, repeats: true, block: { _ in
            self.getSchedules()
        })
    }
}
