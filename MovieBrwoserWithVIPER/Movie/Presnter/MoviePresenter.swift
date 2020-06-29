//
//  MoviePresenter.swift
//  MovieBrwoserWithVIPER
//
//  Created by Tushar on 14/02/19.
//  Copyright © 2019 Tushar. All rights reserved.
//

import Foundation

/// Presenter of 
final public class MoviePresenter: MovieInteractorOutput {
    
    var view: MovieListView!
    var movieArrayDisplayModel: [MovieDispalyModel] = []
    private let pageConstant = 1
    
    func didLoadBrowser(_ movies: MovieResult, currentPage: Int) {
        if movies.totalPages != movies.page {
            if let movieArray = movies.results {
                let movies =  MoviesViewDispalyModal(movies: movieArray)
                movies.movieArrayDisplayModel.forEach { (movie) in
                    movieArrayDisplayModel.append(movie)
                }
                view.updateMovieList(movies: movieArrayDisplayModel, page: currentPage + pageConstant)
            }
        }
    }
    
//    func didLoadSearchBrowser(_ movies: MovieResult, currentPage: Int) {
//        if movies.totalPages != movies.page {
//            if let movieArray = movies.results {
//                let movies =  MoviesViewDispalyModal(movies: movieArray)
//                movies.movieArrayDisplayModel.forEach { (movie) in
//                    movieArrayDisplayModel.append(movie)
//                }
//                view.updateSearchMovieList(movies: movieArrayDisplayModel, page: currentPage + pageConstant)
//            }
//        }
//    }
    

}
