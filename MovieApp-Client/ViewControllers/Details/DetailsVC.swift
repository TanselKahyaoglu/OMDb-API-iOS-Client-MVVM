//
//  DetailsVC.swift
//  MovieApp-Client
//
//  Created by Tansel Kahyaoglu on 29.08.2020.
//  Copyright © 2020 Tansel Kahyaoglu. All rights reserved.
//

import Foundation
import MVVM_Architecture
import UIKit

class DetailsViewData: BaseViewData {
    
    var movie: SearchListModel?
    
    init(movie: SearchListModel) {
        self.movie = movie
    }
}

class DetailsVC: BaseVC<DetailsViewModel> {
    
    @IBOutlet private weak var imgView: UIImageView!
    @IBOutlet private  weak var tagViewYear: TagView!
    @IBOutlet private weak var tagViewRating: TagView!
    @IBOutlet private weak var lblTitle: UILabel!
    @IBOutlet private weak var lblGenre: UILabel!
    @IBOutlet private weak var lblDirector: UILabel!
    @IBOutlet private weak var stackDetails: UIStackView!
    @IBOutlet private weak var stackActors: UIStackView!
    @IBOutlet private weak var lblPlot: UILabel!
    @IBOutlet private weak var btnBack: UIButton!
    @IBOutlet private weak var tabBar: UITabBar!
    
    private enum PageType {
        case Details, Actors
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHandlers()
        if let model = viewData as? DetailsViewData {
            if let imdbID = model.movie?.imdbID {
                viewModel?.getMovieDetails(id: imdbID)
            }
        }
        tabBar.selectedItem = tabBar.items?.first
        tabBar.delegate = self
        configurePage(.Details)
    }
    
    private func configureHandlers() {
        viewModel?.onResponse = { [weak self] movieDetail in
            self?.configureView(model: movieDetail)
        }
        viewModel?.onFailure = { [weak self] error in
            if !error.isEmpty {
                self?.showAlert(title: "network_error".localized(), message: error)
            } else {
                self?.showAlert(title: "network_error".localized(), message: "check_internet".localized())
            }
        }
    }
    private func configureView(model: MovieDetailsResponse) {
        imgView.setImage(url: model.poster)
        tagViewYear.title = model.year
        tagViewRating.title = model.imdbRating
        lblTitle.text = model.title
        lblDirector.text = model.director
        lblGenre.text = model.genre
        lblPlot.text = model.plot
        configureActors(actors: model.getActors())
    }
    
    private func configureActors(actors: [String]) {
        stackActors.removeAllSubviews()
        for actor in actors {
            let label = UILabel()
            label.font = UIFont.boldSystemFont(ofSize: 15)
            label.text = "- \(actor)"
            stackActors.addArrangedSubview(label)
        }
    }
    
    private func configurePage(_ pageType: PageType) {
        switch pageType {
        case .Details:
            stackDetails.isHidden = false
            stackActors.isHidden = true
            break
        case .Actors:
            stackDetails.isHidden = true
            stackActors.isHidden = false
            break
        }
    }
    
    @IBAction func actionBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}

extension DetailsVC: UITabBarDelegate {
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if item.title == "Details"{
            configurePage(.Details)
        } else if item.title == "Actors" {
            configurePage(.Actors)
        }
    }
}
