//
//  SearchInteractor.swift
//  MovieBrwoserWithVIPER
//
//  Created by Tushar on 15/06/20.
//  Copyright (c) 2020 Tushar. All rights reserved.
//

import Foundation

/// Search interactor.
final public class SearchInteractor: SearchViewOutput {
    
    // MARK: - Properties

    /// Presenter.
    var presenter: SearchInteractorOutput!
    
    /// Search Service
    let service: SearchService
    
    // MARK: - Init/Deinit
    
    /// Initializes the Search interactor.
    /// - Parameter service: Search Service
    init(service: SearchService) {
        self.service = service
    }
    
    // MARK:- SearchViewOutput Conformance

    func loadMovieWithSearchString(searchString: String, page: Int) {
        service.getMoviesWithSearch(searchString: searchString, page: page) { (movies, error) in
            
            if let error = error {
                print("Error::",error.localizedDescription)
            }
            
            if let result = movies, let movies = result.results, movies.count > 0 {
                self.presenter.didLoadSearchBrowser(result, currentPage: page)
            }
        }
    }
}
