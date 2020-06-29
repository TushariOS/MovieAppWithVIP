//
//  SearchInteractorOutput.swift
//  MovieBrwoserWithVIPER
//
//  Created by Tushar on 15/06/20.
//  Copyright (c) 2020 Tushar. All rights reserved.
//

import Foundation

/// Search interactor output.
protocol SearchInteractorOutput {
    
    /// Indicate movie data was loaded successfully
    ///
    /// - Parameter movie: Movie.
    func didLoadSearchBrowser(_ movie: MovieResult, currentPage: Int)
}
