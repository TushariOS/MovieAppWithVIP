//
//  MovieDisplayModel.swift
//  MovieBrwoserWithVIPER
//
//  Created by Tushar on 28/02/19.
//  Copyright © 2019 Tushar. All rights reserved.
//

import Foundation

struct MovieDispalyModel {
    
    let IMAGE_BASE_URL = "http://image.tmdb.org/t/p/w185"

    /// Move title.
    let title: String?
    
    /// Poster path.
    let imageUrl: String
    
    /// Orignal title
    let orginalTitle: String?
    
    let rating: Double?
    
    let overView: String?
    
    init(movie: Movie) {
        title = movie.title
        imageUrl = IMAGE_BASE_URL + (movie.posterPath ?? "")
        orginalTitle = movie.orginalTitle
        rating = movie.voteAverage
        overView = movie.overview
    }
}
