//
//  MovieListTableCell.swift
//  MovieApp-Client
//
//  Created by Tansel Kahyaoglu on 29.08.2020.
//  Copyright © 2020 Tansel Kahyaoglu. All rights reserved.
//

import Foundation
import UIKit

class MovieListTableCell: UITableViewCell {
    
    @IBOutlet private weak var imgViewMovie: UIImageView!
    @IBOutlet private weak var lblTitle: UILabel!
    @IBOutlet private weak var lblSubtitle: UILabel!
    
    var movie: SearchListModel? {
        didSet {
            configureCell()
        }
    }
    
    private func configureCell() {
        guard let movie = movie else { return }
        lblTitle.text = movie.title
        lblSubtitle.text = "\(movie.type.capitalized) | \(movie.year)"
        imgViewMovie.setImage(url: movie.poster)
    }

}
