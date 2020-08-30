//
//  MainViewModel.swift
//  MovieApp-Client
//
//  Created by Tansel Kahyaoglu on 29.08.2020.
//  Copyright © 2020 Tansel Kahyaoglu. All rights reserved.
//

import Foundation
import MVVM_Architecture

class MainViewModel: BaseViewModel {

    private let movieService = MovieService()
    
    enum FilterType: String {
        case Movie = "movie", Game = "game", Series = "series", All
    }

    var onResponse: Handler<Bool>?
    var onFailure: Handler<String>?

    private var searchResults = [SearchListModel]()
    var selectedFilterType: FilterType = .All
    
    let filterTypes: [FilterType] = [.All, .Movie, .Series, .Game]
    
    var movieArr = [SearchListModel]()
    
    func doSearch(keyword: String) {
        movieService.search(keyword: keyword,
                            onSuccess: handleSuccess,
                            onFailed: handleFailure)
    }
    
    func filterResults(_ filterType: FilterType) {
        movieArr.removeAll()
        switch filterType {
        case .All:
            movieArr.append(contentsOf: searchResults)
            break
        default:
            movieArr.append(contentsOf: searchResults.filter { $0.type == filterType.rawValue })
            break
        }
    }
    
    private func handleSuccess(_ response: SearchResponse) {
        searchResults =  response.results
        filterResults(.All)
        onResponse?(response.status)
    }
    
    private func handleFailure(_ error: BaseErrorResponse) {
        onFailure?(error.error ?? "")
    }
    
}
