//
//  SearchService.swift
//  MovieBrwoserWithVIPER
//
//  Created by Tushar on 15/06/20.
//  Copyright (c) 2020 Tushar. All rights reserved.
//

import Foundation

/// Search Service.
protocol SearchService {
    
    /// Get movies with search text
     func getMoviesWithSearch(searchString: String, page: Int, compleation: @escaping(MovieResult?, Error?) -> Void)
}
