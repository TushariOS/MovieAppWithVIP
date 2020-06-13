//
//  BuildFactory.swift
//  MovieBrwoserWithVIPER
//
//  Created by Tushar on 16/01/19.
//  Copyright © 2019 Tushar. All rights reserved.
//

import Foundation

protocol BuildFactory {

    func movieListBuilder() -> MovieListBuilder
}
