//
//  RequestBuilder.swift
//  StreamingApp
//
//  Created by Kuda Zata on 27/9/2022.
//

import Foundation

enum HTTPMethod: String {
    case GET
    case POST
    case PUT
    case DELETE
}

struct RequestBuilder {
    
    let url: String?
    let body: Data?
    let headers: [String: String]?
    let httpMethod: HTTPMethod
    
    func createRequest() -> URLRequest? {
        
        if let url = URL(string: self.url!) {
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = httpMethod.rawValue
            urlRequest.allHTTPHeaderFields = headers
            urlRequest.httpBody = body
            urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            return urlRequest
        }
        
        return nil
    }
}
