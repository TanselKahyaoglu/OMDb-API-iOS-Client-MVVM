//
//  WarningView.swift
//  MovieApp-Client
//
//  Created by Tansel Kahyaoglu on 29.08.2020.
//  Copyright © 2020 Tansel Kahyaoglu. All rights reserved.
//

import Foundation
import UIKit

class WarningView: UIView {
    
    @IBOutlet private weak var imgView: UIImageView!
    @IBOutlet private weak var lblMessage: UILabel!
        
    enum ViewType {
        case Error, Info
    }
    
    override func awakeAfter(using coder: NSCoder) -> Any? {
        return loadViewFromNib()
    }
    
    func show(_ type: ViewType, message: String) {
        frame = CGRect(x: frame.minX, y: frame.minY, width: frame.width, height: 0)
        lblMessage.text = message
        configureBackground(type)
        configureImage(type)
        isHidden = false
        UIView.animate(withDuration: 0.4, animations: {
            self.frame = CGRect(x: self.frame.minX,
                                y: self.frame.minY,
                                width: self.frame.width,
                                height: 40)
        })
    }
    
    func hide() {
        if isHidden {
            return
        }
        UIView.animate(withDuration: 0.4, animations: {
            self.frame = CGRect(x: self.frame.minX,
                                y: self.frame.minY,
                                width: self.frame.width,
                                height: 0)
        }, completion: { _ in
            self.isHidden = true
        })
    }
    
    private func configureBackground(_ type: ViewType) {
        switch type {
        case .Error:
            backgroundColor = .red
            break
        case .Info:
            backgroundColor = .orange
            break
        }
    }
    
    private func configureImage(_ type: ViewType) {
        switch type {
        case .Error:
            imgView.image = #imageLiteral(resourceName: "ic_error")
            break
        case .Info:
            imgView.image = #imageLiteral(resourceName: "ic_warning")
            break
        }
    }
}
