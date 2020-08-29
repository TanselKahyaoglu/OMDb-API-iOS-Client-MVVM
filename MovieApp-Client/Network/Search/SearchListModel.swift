//
//  SearchListModel.swift
//  MovieApp-Client
//
//  Created by Tansel Kahyaoglu on 29.08.2020.
//  Copyright © 2020 Tansel Kahyaoglu. All rights reserved.
//

import Foundation

class SearchListModel: Decodable {
    
    var title: String
    var year: String
    var imdbID: String
    var type: String
    var poster: String
    
    enum CodingKeys: String, CodingKey {
        case title = "Title", year = "Year", imdbID, type = "Type", poster = "Poster"
    }
    
    required init(from decoder: Decoder) throws {
        do {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            title = try container.decodeIfPresent(String.self, forKey: .title) ?? ""
            year = try container.decodeIfPresent(String.self, forKey: .year) ?? ""
            imdbID = try container.decodeIfPresent(String.self, forKey: .imdbID) ?? ""
            type = try container.decodeIfPresent(String.self, forKey: .type) ?? ""
            poster = try container.decodeIfPresent(String.self, forKey: .poster) ?? ""
        }
    }
    
}
