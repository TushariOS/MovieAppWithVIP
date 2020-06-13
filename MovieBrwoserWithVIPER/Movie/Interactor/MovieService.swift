//
//  MovieService.swift
//  MovieBrwoserWithVIPER
//
//  Created by Tushar on 24/01/19.
//  Copyright © 2019 Tushar. All rights reserved.
//

import Foundation

/// Movie service protocol
protocol MovieService {

    /// Get movies
    func getMovies(page: Int, compleation: @escaping(MovieResult?, Error?) -> Void)
}
