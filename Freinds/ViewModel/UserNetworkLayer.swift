////
////  Auth_Service.swift
////  Chillow-App
////
////  Created by Syed Basit Gillani on 15/12/2021.
////
//
//import Foundation
//import Combine
//import SwiftUI
//
//protocol AuthService{
//    func request (from endpoint: CallApi) -> AnyPublisher<chillowTables,ApiError>
//}
//
//struct AuthServiceImp: AuthService{
//
//    
////    var model = authModel(oauth_provider: "", oauth_token: "", device_model: "", device_id: "", device_os: "", player_id: "")
//    var cancelable = Set<AnyCancellable>()
//    
//    func request(from endpoint: CallApi) -> AnyPublisher<chillowTables,ApiError>{
//        var body : [String: Any] = ["":""]
//        var table : chillowTables
//        
//        print("dictionary: \(body)")
//        
//        let data = try! JSONSerialization.data(withJSONObject: body)
//        print("jsondata",data)
//        var request = endpoint.urlRequest
//        request.httpMethod = "POST"
//        request.httpBody = data
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        
//       return URLSession.shared.dataTaskPublisher(for: request)
//            .receive(on: DispatchQueue.main)
//            .mapError { _ in ApiError.unknown }
//            .flatMap { data, response -> AnyPublisher<chillowTables,ApiError> in
//                
//                guard let response = response as? HTTPURLResponse else{
//                    print("api not success ")
//                    return Fail(error: ApiError.unknown).eraseToAnyPublisher()
//                }
//                if (200...299).contains(response.statusCode)
//                {
//                    print("api hit correctly")
//                    let jsonDecoder = JSONDecoder()
//
//                        return Just(data)
//                        .decode(type:  chillowTables.self, decoder: jsonDecoder)
//                        .mapError{_ in ApiError.decodingError}
//                        .eraseToAnyPublisher()
//
//                }else{
//                    
//                    if (response.statusCode == 201){
//                        print("api created")
//                    }
//                    
//                     if (response.statusCode == 200){
//                         print("api ok")
//                     }
//                    
//                     if (response.statusCode == 202){
//                         print("api acceppted")
//                     }
//                    if (response.statusCode == 401){
//                        print("unautherize error")
//                    }
//                         if (response.statusCode == 403){
//                             print("resource forbidden error")
//                    }
//                         if (response.statusCode == 404){
//                             print("resource not found error")
//                    }
//                         if (405..<500 ~= response.statusCode){
//                             print("client error")
//                    }
//                         if (500..<600 ~= response.statusCode){
//                             print("server error")
//                    }
//                    print("url not hit ")
//                    return Fail(error: ApiError.errorCode(response.statusCode)).eraseToAnyPublisher()
//                }
//            }
//            .eraseToAnyPublisher()
//    
//}
//
//    
//    
////    func requestCheckPhoneNoIsNotInUseByOther(from endpoint: CallApi) - > AnyPublisher<
//    
//    
//    
//}
//
