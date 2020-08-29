//
//  BaseErrorResponse.swift
//  MovieApp-Client
//
//  Created by Tansel Kahyaoglu on 29.08.2020.
//  Copyright © 2020 Tansel Kahyaoglu. All rights reserved.
//

import Foundation

class BaseErrorResponse {
    
    required init(error: String? = nil,
                  code: Int? = nil) {
        self.error = error
        self.code = code
    }
    
    var error: String?
    var code: Int?
    
}
