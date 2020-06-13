//
//  MoviesViewDispalyModel.swift
//  MovieBrwoserWithVIPER
//
//  Created by Tushar Jaunjalkar on 22/05/19.
//  Copyright © 2019 Tushar. All rights reserved.
//

import Foundation

struct MoviesViewDispalyModal {
    
    var movieArrayDisplayModel: [MovieDispalyModel]
    var movieArray = [Movie]()
    init(movies: [Movie]) {
        
        self.movieArray = movies
        movieArrayDisplayModel = []
        self.movieArray.forEach { (movie) in
            let modelStruct = MovieDispalyModel(movie: movie)
            self.movieArrayDisplayModel.append(modelStruct)
        }
    }
    
    var moviesCout: Int {
        return movieArrayDisplayModel.count
    }
}
