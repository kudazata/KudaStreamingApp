//
//  SchedulesViewModel.swift
//  StreamingApp
//
//  Created by Kuda Zata on 27/6/2022.
//

import Foundation
import Combine

class SchedulesViewModel {
    
    @Published var schedules = [Schedule]()
    private var anyCancellable = Set<AnyCancellable>()
    
    init()
    {}
    
    func getSchedules() {
        SchedulesNetworkService.shared.getSchedules()
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
                self.schedules = schedules
            }
            .store(in: &anyCancellable)
    }
}
