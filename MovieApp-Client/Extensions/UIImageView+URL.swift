//
//  UIImageView+URL.swift
//  MovieApp-Client
//
//  Created by Tansel Kahyaoglu on 29.08.2020.
//  Copyright © 2020 Tansel Kahyaoglu. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    
    func setImage(url: String) {
        DispatchQueue.global(qos: .background).async {
            do {
                if let url = URL(string: url) {
                    let data = try Data.init(contentsOf: url)
                    DispatchQueue.main.async {
                        self.image = UIImage(data: data)
                    }
                }
            } catch {
                print("Error on getting image")
            }
        }

    }
    
}
