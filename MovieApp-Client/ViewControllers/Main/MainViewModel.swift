//
//  MainViewModel.swift
//  MovieApp-Client
//
//  Created by Tansel Kahyaoglu on 29.08.2020.
//  Copyright © 2020 Tansel Kahyaoglu. All rights reserved.
//

import Foundation
import MVVM_Architecture

class MainViewModel: BaseViewModel {
    
    var onResponse: Handler<(isSuccess: Bool, array: [String])>?
    
    func doSearch(keyword: String) {
        onResponse?((true, []))
        
    }
}
