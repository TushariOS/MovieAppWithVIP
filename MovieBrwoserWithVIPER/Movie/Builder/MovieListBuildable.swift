//
//  MovieListBuildable.swift
//  MovieBrwoserWithVIPER
//
//  Created by Tushar on 16/01/19.
//  Copyright © 2019 Tushar. All rights reserved.
//

import UIKit

/// Movie list view injected with all dependencies
protocol MovieListBuildable {

    /// Build movie list view injected with all dependencies.
    ///
    /// - Returns: Movie list view
    func build() -> UIViewController
}
