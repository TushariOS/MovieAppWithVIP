//
//  MovieViewOutput.swift
//  MovieBrwoserWithVIPER
//
//  Created by Tushar on 14/02/19.
//  Copyright © 2019 Tushar. All rights reserved.
//

import Foundation

/// Protocol for get movie list
protocol MovieViewOutput: class {
    
    /// Get movie list
    /// - Parameter page: Number of page for paggination.
    func loadMovie(page: Int)
}
