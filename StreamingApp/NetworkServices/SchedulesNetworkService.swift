//
//  SchedulesNetworkService.swift
//  StreamingApp
//
//  Created by Kuda Zata on 27/6/2022.
//

import Foundation

protocol SchedulesNetworkServiceProtocol {
    func getSchedules(completion: @escaping ([Schedule]?, NetworkError?) -> Void)
}

struct SchedulesNetworkService: SchedulesNetworkServiceProtocol {
    
    func getSchedules(completion: @escaping ([Schedule]?, NetworkError?) -> Void) {
        
        let requestBuilder = RequestBuilder(url: URLs.getSchedulesUrl, body: nil, headers: nil, httpMethod: .GET)
        
        guard let request = requestBuilder.createRequest() else {
            completion(nil, .badUrl)
            return
        }

        let resource = Resource<[Schedule]>(urlRequest: request) { data in
            let decoder = JSONDecoder()
            decoder.setDateDecodingStrategy()
            let schedules = try? decoder.decode([Schedule].self, from: data)
            return schedules
        }
        
        WebService().makeNetworkCall(resource: resource) { result in
            
            switch result {
            case let .success(schedules):
                if let schedules = schedules {
                    completion(schedules, nil)
                }
                else {
                    completion(nil, .decodingError)
                }
                
            case let .failure(error):
                completion(nil, error)
            }
        }
    }
}
