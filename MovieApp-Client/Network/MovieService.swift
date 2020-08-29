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
        let params = ["apiKey": "33bc3aba",
                      "s": keyword]
        Networking.request(method: .get,
                           urlParameters: params,
                           succeed: onSuccess,
                           failed: onFailed)
        
    }
    
}
