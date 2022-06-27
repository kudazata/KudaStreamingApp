//
//  SchedulesNetworkService.swift
//  StreamingApp
//
//  Created by Kuda Zata on 27/6/2022.
//

import Foundation
import Combine

class SchedulesNetworkService {
    
    static let shared = SchedulesNetworkService()
    var anyCancellable = Set<AnyCancellable>()
    
    func getSchedules() -> AnyPublisher<[Schedule], Error> {
        
        let urlString = "https://us-central1-dazn-sandbox.cloudfunctions.net/getSchedule"
        let url = URL.init(string: urlString)!
        var request = URLRequest.init(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let decoder = JSONDecoder()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        
        return Future {[weak self] promise in
            guard let self = self else {return}
            URLSession.shared.dataTaskPublisher(for: url)
                .retry(1)
                .map{$0}
                .tryMap { element -> Data in
                    guard let httpResponse = element.response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                        throw URLError(.badServerResponse)
                    }
                    return element.data
                }
                .decode(type: [Schedule].self, decoder: decoder)
                .receive(on: DispatchQueue.main)
                .sink { _ in
                   
                } receiveValue: { schedules in
                    promise(.success(schedules))
                }
                .store(in: &self.anyCancellable)
        }
        .eraseToAnyPublisher()

    }
}
