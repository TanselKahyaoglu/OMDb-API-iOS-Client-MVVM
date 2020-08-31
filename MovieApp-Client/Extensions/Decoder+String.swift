//
//  Decoder+String.swift
//  MovieApp-Client
//
//  Created by Tansel Kahyaoglu on 30.08.2020.
//  Copyright © 2020 Tansel Kahyaoglu. All rights reserved.
//

import Foundation

extension JSONDecoder {
    
    static func decode<T: Decodable>(T: T.Type ,jsonString: String) -> T? {
        do {
            let data = Data(jsonString.utf8)
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            return nil
        }
    }
    
}
