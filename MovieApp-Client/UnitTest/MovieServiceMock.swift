//
//  MovieServiceMock.swift
//  MovieApp-Client
//
//  Created by Tansel Kahyaoglu on 30.08.2020.
//  Copyright © 2020 Tansel Kahyaoglu. All rights reserved.
//

import Foundation
import MVVM_Architecture

class MovieServiceMock: MovieService {
    
    private static let mockSearchArr = "{\"Search\": [{\"Title\": \"Test\",\"Year\": \"1900\",\"imdbID\": \"tt1234\",\"Type\": \"movie\",\"Poster\": \"\"}],\"totalResults\":\"1\",\"Response\": \"True\"}"
    
    private static let mockMovieDetail = "{\"Title\": \"Test\",\"Year\": \"1972\",\"Released\": \"1972\",\"Genre\": \"Genre\",\"Director\": \"Dir\",\"Actors\": \"Act1, Act2\",\"Plot\": \"Plot\",\"Poster\": \"\",\"imdbRating\": \"9.2\",\"Response\": \"True\"}"
    
    override func search(keyword: String,
                         onSuccess: @escaping Handler<SearchResponse>,
                         onFailed: @escaping Handler<BaseErrorResponse>) {
        if keyword == "success" {
            if let response = JSONDecoder.decode(T: SearchResponse.self, jsonString: MovieServiceMock.mockSearchArr) {
                onSuccess(response)
            }
        } else {
            onFailed(BaseErrorResponse())
        }
    }
    
    
    override func getInfo(id: String,
                          onSuccess: @escaping Handler<MovieDetailsResponse>,
                          onFailed: @escaping Handler<BaseErrorResponse>) {
        if id == "success" {
            if let response = JSONDecoder.decode(T: MovieDetailsResponse.self, jsonString: MovieServiceMock.mockMovieDetail) {
                onSuccess(response)
            }
        } else {
            onFailed(BaseErrorResponse())
        }
    }
}
