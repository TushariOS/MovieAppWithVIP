//
//  MovieDetailViewController.swift
//  MovieBrwoserWithVIPER
//
//  Created by Tushar on 02/01/20.
//  Copyright © 2020 Tushar. All rights reserved.
//

import UIKit
import SDWebImage
class MovieDetailViewController: UIViewController {
    
    /// MovieDispalyModel
    var movieDispalyModel: MovieDispalyModel!
    
    //MARK: - IBOutlet private property
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var ratingLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
  // MARK: - ViewController lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupData()
    }
    
    private func setupData() {
        if let url = URL(string: movieDispalyModel.imageUrl) {
            imageView.sd_setImage(with: url)
        }
        
        titleLabel.text = movieDispalyModel.orginalTitle
        ratingLabel.text = "Rating: \(movieDispalyModel.rating ?? 0.0)"
        descriptionLabel.text = movieDispalyModel.overView
    }
}

extension MovieDetailViewController: StoryboardInstantiable {
    static func parentStoryboard() -> UIStoryboard {
        return .movieInfoMainBoard
    }
}
