//
//  WebService.swift
//  StreamingApp
//
//  Created by Kuda Zata on 27/9/2022.
//

import Foundation

/// The different error types that might occur when making network calls
enum NetworkError: Error {
    case badUrl
    case decodingError
    case badRequest
    case noData
    case customError(Error)
}

extension NetworkError: LocalizedError {
    public var errorDescription: String? {
        return "There was an error connecting to our server. Please try again"
    }
}

/// A resource object to be created when making network calls
struct Resource<T> {
    let urlRequest: URLRequest
    let parse: (Data) -> T?
}

/// The class responsible for all network calls within the app
class WebService {
    
    /// Generic network caller that can take in and return any type of object
    /// - Parameters:
    ///    - resource: object of type Resource to be used for the network call
    ///    - completion: Code to be executed by the caller. Will contain type Result
    func makeNetworkCall<T>(resource: Resource<T>, completion: @escaping (Result<T?, NetworkError>) -> Void) {
        
        URLSession.shared.dataTask(with: resource.urlRequest) { data, response, error in
            
            if let error = error {
                completion(.failure(.customError(error)))
                return
            }
            
            if (response as? HTTPURLResponse)?.statusCode != 200 {
                completion(.failure(.badRequest))
                return
            }
            
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            completion(.success(resource.parse(data)))
            
        }.resume()
    }
    
}

extension JSONDecoder {

    func setDateDecodingStrategy() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        self.dateDecodingStrategy = .formatted(dateFormatter)
    }
   
}
