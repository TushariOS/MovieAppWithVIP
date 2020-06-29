//
//  SearchViewOutput.swift
//  MovieBrwoserWithVIPER
//
//  Created by Tushar on 15/06/20.
//  Copyright (c) 2020 Tushar. All rights reserved.
//

import Foundation

/// Search view output.
protocol SearchViewOutput {
    
    /// get movie list using search text
    /// - Parameters:
    ///   - searchString: Search bar input string
    ///   - page: Page count
    func loadMovieWithSearchString(searchString: String, page: Int)
}
