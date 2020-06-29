//
//  SearchView.swift
//  MovieBrwoserWithVIPER
//
//  Created by Tushar on 15/06/20.
//  Copyright (c) 2020 Tushar. All rights reserved.
//

import Foundation
import UIKit

/// Search view.
protocol SearchView: class {
    
    /// Update the result of movies search
    /// - Parameters:
    ///   - movies: movies result
    ///   - page: page count for paggination
    func updateSearchMovieList(movies: [MovieDispalyModel], page: Int)
    
    /// Indicates when scroll view scrolled.
    ///
    /// - Parameter scrollView: The scroll view used.
    func scrollViewDidScroll(_ scrollView: UIScrollView)
}
