//
//  MovieListBuilder.swift
//  MovieBrwoserWithVIPER
//
//  Created by Tushar on 16/01/19.
//  Copyright © 2019 Tushar. All rights reserved.
//

import Foundation
import UIKit

final class MovieListBuilder: MovieListBuildable {

    /// Dependency Manager
    let dependencyManager: DependencyManager

    // MARK: - Init/Deinit

    /// Init function
    ///
    /// - Parameter dependencyManager:Dependency manager object.
    init(dependencyManager: DependencyManager) {
        self.dependencyManager = dependencyManager
    }

    // MARK: - Protocol Conformance

    func build() -> UIViewController {
        let view = buildView()
        let interactor = buildInterctor()
        let presenter = buildPresenter()
        let router = buildRouter()

        view.interactor = interactor
        interactor.presenter = presenter
        presenter.view = view
        view.router = router

        return view
    }

    // MARK: - Private functions

    /// Create movie list view
    ///
    /// - Returns: Movie list view
    private func buildView() -> MovieListViewController {
        let storyBoard = UIStoryboard(name: "Main", bundle:Bundle.main)
        let movieListViewController = storyBoard.instantiateViewController(withIdentifier: "MovieListViewController") as! MovieListViewController
        movieListViewController.dependencyManager = dependencyManager
        return movieListViewController
    }

    private func buildInterctor() -> MovieInteractor {
        let movieServices = dependencyManager.requestManager()
        let movieInteractor = MovieInteractor(movieService: movieServices)
        return movieInteractor
    }

    private func buildPresenter() -> MoviePresenter {
        return MoviePresenter()
    }
    
    private func buildRouter() -> MovieRouter {
        let router = MovieRouter(dependencyManager: dependencyManager)
        return router
    }
}


/// Defines a view controller as instantiable from a storyboard.
internal protocol StoryboardInstantiable: class {
    /// The view controller's storyboard identifier.
    static var storyboardIdentifier: String { get }

    /**
    The storyboard where one can find the view controller.

    - returns: A new instance of the storyboard.
    */
    static func parentStoryboard() -> UIStoryboard
}

// MARK: - Helper for providing default values, if the class name is the same.
extension StoryboardInstantiable {
    static var storyboardIdentifier: String {
        return String(describing: Self.self)
    }
}

internal extension UIStoryboard {
    /**
    Instantiates the given view controller from its storyboard.

    - parameter : The type of view controller to instantiate.

    - returns: The view controller.
    */
    static func instantiateViewController<T: StoryboardInstantiable, U: UIViewController>(_: T.Type) -> U {
        guard let viewController = T.parentStoryboard().instantiateViewController(withIdentifier: T.storyboardIdentifier) as? U else {
            fatalError("Could not instantiate view controller from storyboard.")
        }

        return viewController
    }
}

internal extension UIStoryboard {
    class var movieInfoMainBoard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: nil)
    }
}
