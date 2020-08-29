//
//  UIView+Nib.swift
//  MovieApp-Client
//
//  Created by Tansel Kahyaoglu on 29.08.2020.
//  Copyright © 2020 Tansel Kahyaoglu. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    class func instantiateNib() -> Self? {
        let nibName = String(describing: type(of: self)).components(separatedBy: ".")[0]
        return UINib(nibName: nibName, bundle: nil).instantiate(withOwner: nil, options: nil)[0] as? Self
    }
    
    func loadViewFromNib() -> Self? {
        if subviews.isEmpty {
            let view =  type(of: self).instantiateNib()
            translatesAutoresizingMaskIntoConstraints = false
            view?.translatesAutoresizingMaskIntoConstraints = false
            return view
        }
        return self

    }


}
