//
//  SearchResponse.swift
//  MovieApp-Client
//
//  Created by Tansel Kahyaoglu on 29.08.2020.
//  Copyright © 2020 Tansel Kahyaoglu. All rights reserved.
//

import Foundation

class SearchResponse: BaseResponse {
    
    var results: [SearchListModel] = []
    
    enum CodingKeys: String, CodingKey {
        case results = "Search"
    }
    
    required init(from decoder: Decoder) throws {
        do {
            try super.init(from: decoder)
            let container = try decoder.container(keyedBy: CodingKeys.self)
            results = try container.decodeIfPresent([SearchListModel].self, forKey: .results) ?? []
        }
    }
    
}
