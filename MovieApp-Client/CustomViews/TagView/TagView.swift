//
//  TagView.swift
//  MovieApp-Client
//
//  Created by Tansel Kahyaoglu on 29.08.2020.
//  Copyright © 2020 Tansel Kahyaoglu. All rights reserved.
//

import Foundation
import UIKit

class TagView: UIView {
    
    var title: String = "" {
        didSet {
            configureView()
        }
    }
    
    @IBOutlet private weak var lblTag: UILabel!
    
    override func awakeAfter(using coder: NSCoder) -> Any? {
        return loadViewFromNib()
    }
    
    private func configureView() {
        lblTag.text = title
        lblTag.sizeToFit()
    }
}
