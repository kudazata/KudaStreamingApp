//
//  EventsNetworkService.swift
//  StreamingApp
//
//  Created by Kuda Zata on 24/6/2022.
//

import Foundation

class EventsNetworkService {
    
    /// Fetch an array of events
    /// - Parameters:
    ///   - completion: Block of code to be executed by caller
    func getEvents(completion: @escaping ([Event]?, NetworkError?) -> Void) {
        
        let requestBuilder = RequestBuilder(url: Apis.getEventsApi, body: nil, headers: nil, httpMethod: .GET)
        
        guard let urlRequest = requestBuilder.createRequest() else {
            completion(nil, .badUrl)
            return
        }
        
        let resource = Resource<[Event]>(urlRequest: urlRequest) { data in
            let decoder = JSONDecoder()
            decoder.setDateDecodingStrategy()
            let events = try? decoder.decode([Event].self, from: data)
            return events
        }

        WebService().makeNetworkCall(resource: resource) { result in
            switch result {
            case let .success(events):
                if events != nil {
                    completion(events, nil)
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
