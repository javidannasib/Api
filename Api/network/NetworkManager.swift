//
//  NetworkManager.swift
//  Api
//
//  Created by Javidan Nasib on 27.02.24.
//

import UIKit

class NetworkManager: NSObject {
    
    static let shared = NetworkManager()
    
    func fetchData<T: Decodable>(from urlString : String, method : HttpMethod, body : Data?, completion : @escaping (Result<T, NetworkError>)->Void) {
    
        guard let url = URL(string: urlString) else {
            completion(.failure(.InvalidURL))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.httpBody = body
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(.unknown(error)))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else{
                let error = NSError(domain: "Invalid response", code: -1)
                completion(.failure(.unknown(error)))
                return
            }
            
            if (200...299).contains(httpResponse.statusCode){
                completion(.failure(.httpResponseError(statusCode: httpResponse.statusCode)))
                return
            }
            
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            print("herseyden tamam")
            
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedData))
            } catch {
                completion(.failure(.decodingError))
            }
            
        }.resume()
    }
    
}
