//
//  Networking.swift
//  MovieApp-Client
//
//  Created by Tansel Kahyaoglu on 29.08.2020.
//  Copyright © 2020 Tansel Kahyaoglu. All rights reserved.
//

import Foundation

class Networking {
    
    private static let baseUrl = "http://www.omdbapi.com"
    
    enum HTTPMethod: String {
        case get = "GET"
        case post = "POST"
        case put = "PUT"
        case delete = "DELETE"
    }
    
    class func request<S: Decodable, F: BaseErrorResponse>(method: HTTPMethod,
                                                              urlParameters: [String: String],
                                                              succeed: @escaping (S) -> Void,
                                                              failed: @escaping (F) -> Void) {
        
        
        guard var components = URLComponents(string: baseUrl) else { return }
        components.queryItems = urlParameters.map {
            URLQueryItem(name: $0.key, value: $0.value)
        }
        
        guard let url = components.url else { return }
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        URLSession.shared.dataTask(with: request,
                                   completionHandler: { data, response, error in
                                    if let error = error {
                                        DispatchQueue.main.async {
                                            failed(F(error: error.localizedDescription))
                                        }
                                    }
                                    if let status = response as? HTTPURLResponse {
                                        guard let data = data else { return }
                                        print("Response Code: \(status.statusCode)")
                                        if status.statusCode >= 200 && status.statusCode <= 399 {
                                            do {
                                                let decoder = try JSONDecoder().decode(S.self, from: data)
                                                DispatchQueue.main.async {
                                                    succeed(decoder)
                                                }
                                            } catch {
                                                DispatchQueue.main.async {
                                                    failed(F(error: "Decoding Error", code: status.statusCode))
                                                }
                                            }
                                        } else {
                                            DispatchQueue.main.async {
                                                failed(F(error: "Error on server. Response code: \(status.statusCode)", code: status.statusCode))
                                            }
                                        }
                                    }
        }).resume()
    }
}
