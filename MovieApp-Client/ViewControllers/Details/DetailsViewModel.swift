//
//  DetailsViewModel.swift
//  MovieApp-Client
//
//  Created by Tansel Kahyaoglu on 29.08.2020.
//  Copyright © 2020 Tansel Kahyaoglu. All rights reserved.
//

import Foundation
import MVVM_Architecture
import UIKit

class DetailsViewModel: BaseViewModel {
    
    private let movieService = MovieService()

    var onResponse: Handler<MovieDetailsResponse>?
    var onFailure: Handler<String>?
    
    func getMovieDetails(id: String) {
        movieService.getInfo(id: id,
                             onSuccess: handleSuccess,
                             onFailed: handleFailure)
    }
    
    private func handleSuccess(_ response: MovieDetailsResponse) {
        onResponse?(response)
    }
    
    private func handleFailure(_ error: BaseErrorResponse) {
        onFailure?(error.error ?? "")
    }
    
}
