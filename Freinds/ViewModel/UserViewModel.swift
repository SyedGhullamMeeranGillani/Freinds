//
//  ArticleViewModel.swift
//  NewsAPI
//
//  Created by Tunde on 08/02/2021.
//

import Foundation
import Combine

protocol UserViewModel {
    func getUser()
}

enum ResultState {
    case loading
    case failed(error: Error)
    case success(content: [Result])
}


class UserViewModelImpl: ObservableObject, UserViewModel {
    
    private let service: UserService

    private(set) var user = [Result]()
    private(set) var location = [Location]()
    @Published private(set) var state: ResultState = .loading

    private var cancellables = Set<AnyCancellable>()

    init(service: UserService) {
        self.service = service
    }
    
    func getUser() {
        print("enter get user")
        self.state = .loading
        
        let cancellable = self.service
            .request(from: .getUser)
            .sink { (res) in
                switch res {
                case .failure(let error):
                    self.state = .failed(error: error)
                    print("enter sink failure")
                case .finished:
                    self.state = .success(content: self.user)
                    print("enter sink finished")
                }
            } receiveValue: { res in
                

//                self.user = res.results
                    self.user.append(contentsOf: res.results)
                
                
//                for i in 0 ... 3 {
//                self.user.append(contentsOf: res.results)
//                }
                
                
                print("print all values: \(res.results)")
            }
        self.cancellables.insert(cancellable)
    }
}
