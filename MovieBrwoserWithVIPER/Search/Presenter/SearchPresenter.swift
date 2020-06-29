//
//  SearchPresenter.swift
//  MovieBrwoserWithVIPER
//
//  Created by Tushar on 15/06/20.
//  Copyright (c) 2020 Tushar. All rights reserved.
//

import Foundation

/// Search presenter.
final class SearchPresenter: SearchInteractorOutput {
    
    // MARK: - Properties
    private let pageConstant = 1
    
    var movieArrayDisplayModel: [MovieDispalyModel] = []
    
    /// Search View.
    var view: SearchView?
    
    func didLoadSearchBrowser(_ movie: MovieResult, currentPage: Int) {
        if movie.totalPages != movie.page {
            if let movieArray = movie.results {
                let movies =  MoviesViewDispalyModal(movies: movieArray)
                movies.movieArrayDisplayModel.forEach { (movie) in
                    movieArrayDisplayModel.append(movie)
                }
                view?.updateSearchMovieList(movies: movieArrayDisplayModel, page: currentPage + pageConstant)
            }
        }
    }
}
