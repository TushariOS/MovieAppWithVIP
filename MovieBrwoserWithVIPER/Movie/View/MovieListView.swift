//
//  MovieListView.swift
//  MovieBrwoserWithVIPER
//
//  Created by Tushar on 14/02/19.
//  Copyright © 2019 Tushar. All rights reserved.
//

import Foundation
import UIKit

protocol MovieListView: class {
    
    func updateMovieList(movies: [MovieDispalyModel], page: Int)

    /// Indicates when scroll view scrolled.
    ///
    /// - Parameter scrollView: The scroll view used.
    func scrollViewDidScroll(_ scrollView: UIScrollView)
}
