//
//  Network.swift
//  Recipe App
//
//  Created by Mahmoud Mohamed Atrees on 14/12/2024.
//

import Foundation
import Combine

struct Network{
    
    func getData<T: Decodable>(url: String, model: T.Type, headers: [String:String]?) -> AnyPublisher<T, Error>{
        guard let url = URL(string: url)
        else {
            return Fail(error: URLError(.badURL))
                .eraseToAnyPublisher()
        }
        
        var request = URLRequest(url: url)
        
        if let headers = headers {
            for (key, value) in headers {
                request.addValue(value, forHTTPHeaderField: key)
            }
        }
                
        return URLSession.shared.dataTaskPublisher(for: request)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .tryMap { data, response in
                guard let response = response as? HTTPURLResponse, response.statusCode >= 200 && response.statusCode <= 299
                else {
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
