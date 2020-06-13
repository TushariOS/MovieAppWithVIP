//
//  MovieCollectionViewCell.swift
//  MovieBrwoserWithVIPER
//
//  Created by Tushar on 16/01/19.
//  Copyright © 2019 Tushar. All rights reserved.
//

import UIKit
import SDWebImage

class MovieCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Private Properties
    
    /// Movie Image View.
    @IBOutlet private weak var movieImageView: UIImageView!
    
    /// Movie Name UILabel.
    @IBOutlet private weak var movieNameLabel: UILabel!
    
    // MARK: -  Functions
    
    func setUpCellData(movie: MovieDispalyModel) {
        movieNameLabel.text = movie.title
        movieNameLabel.textColor = .black
        let url = URL(string: movie.imageUrl)
        movieImageView.sd_setImage(with: url, placeholderImage: UIImage(named: "splash"))
    }
}
