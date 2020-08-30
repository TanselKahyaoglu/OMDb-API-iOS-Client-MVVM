//
//  String+Localizable.swift
//  MovieApp-Client
//
//  Created by Tansel Kahyaoglu on 30.08.2020.
//  Copyright © 2020 Tansel Kahyaoglu. All rights reserved.
//

import Foundation

extension String {
    
    func localized(comment: String = "") -> String {
        return NSLocalizedString(self, comment: comment)
    }
    
}
