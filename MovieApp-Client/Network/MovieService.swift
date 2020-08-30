//
//  MovieService.swift
//  MovieApp-Client
//
//  Created by Tansel Kahyaoglu on 29.08.2020.
//  Copyright © 2020 Tansel Kahyaoglu. All rights reserved.
//

import Foundation
import MVVM_Architecture

class MovieService {
    
    func search(keyword: String,
                onSuccess: @escaping Handler<SearchResponse>,
                onFailed: @escaping Handler<BaseErrorResponse>) {
        let params = ["apiKey": Constants.Network.apiKey,
                      "s": keyword]
        Networking.request(method: .get,
                           urlParameters: params,
                           succeed: onSuccess,
                           failed: onFailed)
        
    }
    
    func getInfo(id: String,
                 onSuccess: @escaping Handler<MovieDetailsResponse>,
                 onFailed: @escaping Handler<BaseErrorResponse>) {
        let params = ["apiKey": Constants.Network.apiKey,
                      "i": id]
        Networking.request(method: .get,
                           urlParameters: params,
                           succeed: onSuccess,
                           failed: onFailed)
    }
    
}
