//
//  ArticleEndpoint.swift
//  NewsAPI
//
//  Created by Tunde on 08/02/2021.
//

import Foundation

protocol APIBuilder {
    var urlRequest: URLRequest { get }
    var baseUrl: URL { get }
    var path: String { get }
}

enum UserAPI {
    case getUser
}

extension UserAPI: APIBuilder {

    var baseUrl: URL {
        switch self {
        case .getUser:
            return URL(string: "https://randomuser.me")!
        }
    }
    
    var path: String {
        switch self {
        case .getUser:
            return "/api/"

        }
    }
    
    var urlRequest: URLRequest {
        switch self {
        case .getUser:
            return URLRequest(url: self.baseUrl.appendingPathComponent(self.path))
        }
    }
}
