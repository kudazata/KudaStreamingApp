//
//  EventsNetworkServiceMock.swift
//  StreamingAppTests
//
//  Created by Kuda Zata on 29/9/2022.
//

import Foundation
@testable import StreamingApp

struct EventsNetworkServiceMock: EventsNetworkServiceProtocol {
    
    var shouldReturnError = false
    
    func getEvents(completion: @escaping ([Event]?, NetworkError?) -> Void) {
        
        if shouldReturnError {
            completion(nil, .decodingError)
            return
        }
        else {
            let event1 = Event(id: "1", title: "Man City vs Arsenal", subtitle: "Champions League", date: Date(), imageUrl: "www.image.com", videoUrl: "www.video.com")
            let event2 = Event(id: "2", title: "Man Utd vs Liverpool", subtitle: "Premier League", date: Date(), imageUrl: "www.image.com", videoUrl: "www.video.com")
            
            let events = [event1, event2]
            completion(events, nil)
        }
    }
    
}
