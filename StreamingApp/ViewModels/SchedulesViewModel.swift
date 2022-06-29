//
//  SchedulesViewModel.swift
//  StreamingApp
//
//  Created by Kuda Zata on 27/6/2022.
//

import Foundation
import Combine

class SchedulesViewModel {
    
    var schedules = CurrentValueSubject<[Schedule], Never>([Schedule]())
    private var anyCancellable = Set<AnyCancellable>()
    
    init()
    {}
    
    let schedulesService = SchedulesNetworkService()
    
    func getSchedules() {
        schedulesService.getScheduless()
            .receive(on: DispatchQueue.main)
            .map{$0}
            .sink { completion in
                switch completion {
                case .finished:
                    print("finished")
                    
                case .failure(let error):
                    print(error.localizedDescription)
                }
            } receiveValue: { [weak self] schedules in
                guard let self = self else {return}
                self.schedules.send(schedules.sorted(by: {$0.date!.compare($1.date!) == .orderedAscending}))
            }
            .store(in: &anyCancellable)
    }
}
