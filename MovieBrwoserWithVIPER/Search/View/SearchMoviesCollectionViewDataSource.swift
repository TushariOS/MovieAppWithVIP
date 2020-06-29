//
//  SearchMoviesDataSource.swift
//  MovieBrwoserWithVIPER
//
//  Created by Tushar on 20/06/20.
//  Copyright © 2020 Tushar. All rights reserved.
//

import Foundation
import UIKit

final class SearchMoviesCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    
    var movieDataSource: [MovieDispalyModel] = []

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
