//
//  NetworkManager.swift
//  UserAuthFirebase
//
//  Created by Gerard on 6/5/24.
//

import Foundation
import UIKit

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    static let baseURL = ConstantStrings.API.baseURL
    static let path = ConstantStrings.Path.user
    static let registerUser = ConstantStrings.Endpoints.User.registerUser
    
    private let registerUrl = baseURL+path+registerUser
    
    private init() {
        
    }
    
    // sample call
    func registerUser(body: User, completion: @escaping(Result<User, APError>) -> Void) {
        guard let url = URL(string: registerUrl) else {
            completion(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let _ = error   {
                completion(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(User.self, from: data)
                
                completion(.success(decodedResponse))
            } catch {
                completion(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
    
    
}
