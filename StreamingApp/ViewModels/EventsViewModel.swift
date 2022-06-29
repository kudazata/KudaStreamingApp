//
//  EventViewModel.swift
//  StreamingApp
//
//  Created by Kuda Zata on 24/6/2022.
//

import Foundation
import Combine

class EventsViewModel {
    
    @Published var events = [Event]()
    private var anyCancellable = Set<AnyCancellable>()
    let dateFormatter = DateFormatter()
    
    init()
    {}
    
    let eventsService = EventsNetworkService()
    
    func getEvents() {
        
        eventsService.getEvents()
            .receive(on: DispatchQueue.main)
            .map{$0}
            .sink { completion in
                switch completion {
                case .finished:
                    print("finished")
                    
                case .failure(let error):
                    print(error.localizedDescription)
                }
            } receiveValue: { [weak self] events in
                guard let self = self else {return}
                self.events = events.sorted(by: {$0.date!.compare($1.date!) == .orderedAscending})
            }
            .store(in: &anyCancellable)
    }
}
