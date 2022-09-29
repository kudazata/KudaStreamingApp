//
//  SchedulesNetworkServiceMock.swift
//  StreamingAppTests
//
//  Created by Kuda Zata on 29/9/2022.
//

import Foundation
@testable import StreamingApp

struct SchedulesNetworkServiceMock: SchedulesNetworkServiceProtocol {
    
    var shouldReturnError = false
    
    func getSchedules(completion: @escaping ([Schedule]?, NetworkError?) -> Void) {
        
        if shouldReturnError {
            completion(nil, .decodingError)
        }
        else {
            let schedule1 = Schedule(id: "1", title: "Chelsea vs Newcastle", subtitle: "FA Cup", date: Date(), imageUrl: "www.image1.com")
            
            let schedule2 = Schedule(id: "2", title: "Barcelona vs Real Madrid", subtitle: "La Liga", date: Date(), imageUrl: "www.image2.com")
            
            let schedules = [schedule1, schedule2]
            
            completion(schedules, nil)
        }
    }
    
}
