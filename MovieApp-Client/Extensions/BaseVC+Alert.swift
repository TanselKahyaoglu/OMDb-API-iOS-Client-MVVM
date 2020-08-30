//
//  BaseVC+Alert.swift
//  MovieApp-Client
//
//  Created by Tansel Kahyaoglu on 30.08.2020.
//  Copyright © 2020 Tansel Kahyaoglu. All rights reserved.
//

import Foundation
import MVVM_Architecture
import UIKit

extension BaseVC {
    
    func showAlert(title: String? = nil, message: String? = nil, actions: [UIAlertAction]? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        if let actions = actions {
            for action in actions {
                alert.addAction(action)
            }
        } else {
            alert.addAction(UIAlertAction(title: "Okay", style: .cancel))
        }
        show(alert, sender: nil)
    }
    
}
