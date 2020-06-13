//
//  MovieInteractor.swift
//  MovieBrwoserWithVIPER
//
//  Created by Tushar on 14/02/19.
//  Copyright © 2019 Tushar. All rights reserved.
//

import Foundation

final public class MovieInteractor: MovieViewOutput {
    
    /// Protocol instance of MovieInteractorOutput
    var presenter: MovieInteractorOutput!
    
    /// MovieService instance
    var movieService: MovieService
    
    init(movieService: MovieService) {
        self.movieService = movieService
    }
    
    func loadMovie(page: Int) {
        movieService.getMovies(page: page) { (movie, error) in
            if (error != nil) {
                print(error.debugDescription)
            }
            
            if let result = movie {
                self.presenter.didLoadBrowser(result, currentPage: page)
            }
        }
    }
}
