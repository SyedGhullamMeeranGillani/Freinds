//
//  ArticleService.swift
//  NewsAPI
//
//  Created by Tunde on 08/02/2021.
//

import Foundation
import Combine

protocol UserService {
     func request(from endpoint: UserAPI) -> AnyPublisher<User, APIError>
}

struct UserServiceImpl: UserService {

    func request(from endpoint: UserAPI) -> AnyPublisher<User, APIError> {
        
        print("enter user service implementaion service")
        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .iso8601
        
        var request = endpoint.urlRequest
        request.httpMethod = "GET"

        print("http method \(request.allHTTPHeaderFields)")
        print("url : \(endpoint.urlRequest)")
        
        
        return URLSession.shared
            .dataTaskPublisher(for: request)
            
            .receive(on: DispatchQueue.main)
            
            .mapError { _ in .unknown }
            .flatMap { data, response -> AnyPublisher<User, APIError> in

                guard let response = response as? HTTPURLResponse else {
                    return Fail(error: .unknown)
                            .eraseToAnyPublisher()
                }

                if (200...299).contains(response.statusCode) {
                    return Just(data)
                        .decode(type: User.self, decoder: jsonDecoder)
                        .mapError {_ in .decodingError}
                        .eraseToAnyPublisher()
                } else{
                  
                    return Fail(error: .errorCode(response.statusCode))
                            .eraseToAnyPublisher()
                }
            }
            
            .eraseToAnyPublisher()
    }
}
