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
    
    init()
    {}
    
    func getEvents() {
        
        EventsNetworkService.shared.getEvents()
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
                self.events = events
            }
            .store(in: &anyCancellable)

    }
//    var title: String?
//    var subtitle: String?
//    var date: String?
//    var eventImageUrl: String?
//
//    init(event: Event) {
//        self.title = event.title
//        self.subtitle = event.subtitle
//        self.date = event.date
//        self.eventImageUrl = event.imageUrl
//    }
}
