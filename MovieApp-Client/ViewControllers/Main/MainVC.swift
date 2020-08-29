//
//  MainVC.swift
//  MovieApp-Client
//
//  Created by Tansel Kahyaoglu on 29.08.2020.
//  Copyright © 2020 Tansel Kahyaoglu. All rights reserved.
//

import Foundation
import MVVM_Architecture
import UIKit

class MainVC: BaseVC<MainViewModel> {
    
    @IBOutlet private weak var viewSearch: UIView!
    @IBOutlet private weak var tfSearch: UITextField!
    @IBOutlet private weak var btnSearch: UIButton!
    @IBOutlet private weak var btnFilter: UIButton!
    
    private enum MainVCState {
        case NoResult, Cleared, SearchResults
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurePageState(.Cleared)
    }
    
    private func configurePageState(_ state: MainVCState) {
        switch state {
        case .NoResult:
            btnFilter.isHidden = true
        case .Cleared:
            btnFilter.isHidden = true
            setInitialResources()
        case .SearchResults:
            btnFilter.isHidden = false
        }
    }
    
    private func setInitialResources() {
        tfSearch.placeholder = "Search..."
        btnFilter.setTitle("Filter", for: .normal)
    }
    
    private func configureHandlers() {
        viewModel?.onResponse = { [weak self] result in
            if result.isSuccess {
                self?.configurePageState(.SearchResults)
            } else {
                self?.configurePageState(.NoResult)
            }
        }
    }
    
    private func doSearch() {
        tfSearch.endEditing(true)
        if let keyword = tfSearch.text {
            viewModel?.doSearch(keyword: keyword)
        }
    }
    
    
    @IBAction private func actionSearch(_ sender: Any) {
        doSearch()
    }
    
    @IBAction private func actionPrimaryTextField(_ sender: Any) {
        doSearch()
    }
    
    @IBAction private func actionFilter(_ sender: Any) {
    }
    
    
    
}
