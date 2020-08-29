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
    @IBOutlet private weak var btnFilter: PickerButton!
    @IBOutlet private weak var tvResults: UITableView!
    @IBOutlet private weak var viewWarning: WarningView!
        
    private enum MainVCState {
        case Initial, NoResult, Cleared, SearchResults
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureFilterPicker()
        configureHandlers()
        configurePageState(.Initial)
    }
    
    private func configureFilterPicker() {
        btnFilter.onFilterSelected = { [weak self] row in
            self?.viewModel?.filterResults(self?.viewModel?.filterTypes[row] ?? .All)
            DispatchQueue.main.async {
                self?.tvResults.reloadData()
            }
        }
        btnFilter.configureInputs(inputs: viewModel?.filterTypes.map { $0.rawValue } ?? [])
    }
    
    private func configurePageState(_ state: MainVCState) {
        switch state {
        case .Initial:
            configureInitialState()
            break
        case .NoResult:
            configureNoResultState()
            break
        case .Cleared:
            configureClearedState()
            break
        case .SearchResults:
            configureSearchResultsState()
            break
        }
    }
    
    private func configureSearchResultsState() {
        viewWarning.hide()
        btnFilter.isHidden = false
        tvResults.isHidden = false
        btnFilter.initialTitle = "Filter"
        tvResults.reloadData()
    }
    
    private func configureNoResultState() {
        viewWarning.show(.Error, message: "No result found")
        btnFilter.isHidden = true
        tvResults.isHidden = true
    }
    
    private func configureClearedState() {
        viewWarning.hide()
        btnFilter.isHidden = true
        tvResults.isHidden = true
    }
    
    private func configureInitialState() {
        viewWarning.isHidden = true
        tvResults.isHidden = true
        tfSearch.placeholder = "Search..."
        btnFilter.initialTitle = "Filter"
        btnFilter.isHidden = true
    }
    
    private func configureHandlers() {
        viewModel?.onResponse = { [weak self] result in
            if result {
                self?.configurePageState(.SearchResults)
            } else {
                self?.configurePageState(.NoResult)
            }
        }
    }
    
    private func doSearch() {
        tfSearch.endEditing(true)
        btnFilter.resetPicker()
        if let keyword = tfSearch.text, keyword.count > 3 {
            viewModel?.doSearch(keyword: keyword)
        } else {
            viewWarning.show(.Info, message: "Please enter at least 3 character")
        }
    }
    
    @IBAction private func actionSearch(_ sender: Any) {
        doSearch()
    }
    
    @IBAction private func actionPrimaryTextField(_ sender: Any) {
        doSearch()
    }
    
}

extension MainVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.movieArr.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieListTableCell") as? MovieListTableCell else { return UITableViewCell() }
        cell.movie = viewModel?.movieArr[indexPath.row]
        return cell
    }
    
}
