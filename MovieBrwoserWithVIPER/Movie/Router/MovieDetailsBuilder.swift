
//
//  MovieDetailsBuilder.swift
//  MovieBrwoserWithVIPER
//
//  Created by Tushar on 01/01/20.
//  Copyright © 2020 Tushar. All rights reserved.
//

import Foundation
import UIKit

final class MovieDetailsBuilder: MovieListBuildable {
    
//    let dependencyManger : DependencyManager
//    
//    
//    init(dependencyManger: DependencyManager) {
//        self.dependencyManger = dependencyManger
//    }
    
    let movieDispalyModel: MovieDispalyModel!
    init(movieDispalyModel: MovieDispalyModel) {
        self.movieDispalyModel = movieDispalyModel
    }
    
    func build() -> UIViewController {
        let view = buildView()
        return view
    }
    
    private func buildView() -> MovieDetailViewController {
        let view: MovieDetailViewController = UIStoryboard.instantiateViewController(MovieDetailViewController.self)
        view.movieDispalyModel = self.movieDispalyModel
        return view
    }
}
