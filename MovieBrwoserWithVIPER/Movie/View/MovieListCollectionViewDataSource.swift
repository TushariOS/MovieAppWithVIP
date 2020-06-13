//
//  MovieListCollectionViewDataSource.swift
//  MovieBrwoserWithVIPER
//
//  Created by Tushar on 17/01/19.
//  Copyright © 2019 Tushar. All rights reserved.
//

import Foundation
import UIKit

/// The movie list collection view data source.
final class MovieListCollectionViewDataSource: NSObject, UICollectionViewDataSource {

     var movieDataSource: [MovieDispalyModel] = []

    // MARK: - UICollection View Delegates
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieDataSource.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return setMovieListCell(indexPath: indexPath, for : collectionView)
    }

    // MARK: - Private functions

    private func setMovieListCell(indexPath: IndexPath, for collectionView: UICollectionView) -> UICollectionViewCell {
        let cell: MovieCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCollectionViewCell", for: indexPath) as! MovieCollectionViewCell
            cell.setUpCellData(movie: movieDataSource[indexPath.row])
        return cell
    }
}
