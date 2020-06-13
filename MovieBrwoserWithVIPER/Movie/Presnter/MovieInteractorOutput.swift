//
//  MovieInteractorOutput.swift
//  MovieBrwoserWithVIPER
//
//  Created by Tushar on 14/02/19.
//  Copyright © 2019 Tushar. All rights reserved.
//

import Foundation

protocol MovieInteractorOutput: class {
    
    /// Indicate movie data was loaded successfully
    ///
    /// - Parameter movie: Movie.
    func didLoadBrowser(_ movie: MovieResult, currentPage: Int)
}
