//
//  StackView+Subviews.swift
//  MovieApp-Client
//
//  Created by Tansel Kahyaoglu on 30.08.2020.
//  Copyright © 2020 Tansel Kahyaoglu. All rights reserved.
//

import Foundation
import UIKit

extension UIStackView {
    
    func removeAllSubviews() {
        for view in subviews {
            view.removeFromSuperview()
        }
    }
    
}
