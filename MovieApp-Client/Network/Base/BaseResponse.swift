//
//  BaseResponse.swift
//  MovieApp-Client
//
//  Created by Tansel Kahyaoglu on 29.08.2020.
//  Copyright © 2020 Tansel Kahyaoglu. All rights reserved.
//

import Foundation

class BaseResponse: Decodable {

    var status: Bool
    
    enum CodingKeys: String, CodingKey {
        case status = "Response"
    }
    
    required init(from decoder: Decoder) throws {
        do {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            status = try container.decodeIfPresent(String.self, forKey: .status) == "True"
        }
    }

}
