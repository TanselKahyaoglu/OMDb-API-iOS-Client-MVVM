//
//  MovieDetailsResponse.swift
//  MovieApp-Client
//
//  Created by Tansel Kahyaoglu on 30.08.2020.
//  Copyright © 2020 Tansel Kahyaoglu. All rights reserved.
//

import Foundation

class MovieDetailsResponse: BaseResponse {
    
    var title: String = ""
    var year: String = ""
    var released: String = ""
    var director: String = ""
    var genre: String = ""
    var actors: String = ""
    var poster: String = ""
    var imdbRating: String = ""
    var plot: String = ""
   
    enum CodingKeys: String, CodingKey {
        case title = "Title",
        year = "Year",
        released = "Released",
        director = "Director",
        genre = "Genre",
        actors = "Actors",
        poster = "Poster",
        imdbRating,
        plot = "Plot"
    }
    
    required init(from decoder: Decoder) throws {
        do {
            try super.init(from: decoder)
            let container = try decoder.container(keyedBy: CodingKeys.self)
            title = try container.decodeIfPresent(String.self, forKey: .title) ?? ""
            year = try container.decodeIfPresent(String.self, forKey: .year) ?? ""
            released = try container.decodeIfPresent(String.self, forKey: .released) ?? ""
            director = try container.decodeIfPresent(String.self, forKey: .director) ?? ""
            actors = try container.decodeIfPresent(String.self, forKey: .actors) ?? ""
            poster = try container.decodeIfPresent(String.self, forKey: .poster) ?? ""
            genre = try container.decodeIfPresent(String.self, forKey: .genre) ?? ""
            imdbRating = try container.decodeIfPresent(String.self, forKey: .imdbRating) ?? ""
            plot = try container.decodeIfPresent(String.self, forKey: .plot) ?? ""
        }
    }
    
    func getActors() -> [String] {
        return actors.split(separator: ",").map { String($0.trimmingCharacters(in: .whitespacesAndNewlines)) }
    }
    
}
