//
//  LoadingHelper.swift
//  MovieApp-Client
//
//  Created by Tansel Kahyaoglu on 30.08.2020.
//  Copyright © 2020 Tansel Kahyaoglu. All rights reserved.
//

import Foundation
import UIKit

class LoadingHelper {
    
    static let shared = LoadingHelper()
    
    private let loadingIndicatorView = LoadingIndicator.instantiateNib()
    
    var isShowing: Bool = false
    
    func show() {
        if !isShowing {
            print("show")
            isShowing = true
            guard let window = WindowManager.getWindow() else { return }
            DispatchQueue.main.async { [weak self] in
                guard let indicatorView = self?.loadingIndicatorView else { return }
                window.addSubview(indicatorView)
                window.bringSubviewToFront(indicatorView)
            }
        }
    }
    
    func hide() {
        DispatchQueue.main.async { [weak self] in
            print("hide")
            self?.isShowing = false
            self?.loadingIndicatorView?.removeFromSuperview()
        }
    }
    
}
