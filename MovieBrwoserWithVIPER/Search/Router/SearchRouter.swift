//
//  SearchRouter.swift
//  MovieBrwoserWithVIPER
//
//  Created by Tushar on 15/06/20.
//  Copyright (c) 2020 Tushar. All rights reserved.
//

import UIKit

/// Search router.
final class SearchRouter {

    // MARK: - Properties

    /// The dependency manager.
    let dependencyManager: DependencyManager
    
    /// Navigation controller.
    weak var navigationController: UINavigationController?

    /// The view controller that will present other views.
    weak var viewController: UIViewController?

    // MARK: - Init
    
    /// Create an instance of the router with its necessary dependencies.
    ///
    /// - Parameter dependencyManager: The dependency manager.
    init(dependencyManager: DependencyManager) {
        self.dependencyManager = dependencyManager
    }
    
    /// Route to Movie detail screen
    /// - Parameter movie: Movie display
    func routeToMovieDetial(movie: MovieDispalyModel) {

        let movieDetailViewController = MovieDetailsBuilder(movieDispalyModel: movie).build()
        navigationController?.pushViewController(movieDetailViewController, animated: true)
    }
}
