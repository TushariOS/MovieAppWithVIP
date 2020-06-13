//
//  MovieListCollectionViewDelegate.swift
//  MovieBrwoserWithVIPER
//
//  Created by Tushar on 17/01/19.
//  Copyright © 2019 Tushar. All rights reserved.
//

import Foundation
import UIKit

final class MovieListCollectionViewDelegate: NSObject, UICollectionViewDelegate {

    /// Delegate for Movie list view
    weak var delegate: MovieListView?
    
    /// Delegate instance of MovieInteractionDelegate
    weak var interactionDelegate: MovieInteractionDelegate?
    
    var movieDataSource: [MovieDispalyModel] = []

    /// Define constant value of layout
    fileprivate struct LayoutConstant {
        static let cellHeight: CGFloat = 200
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        interactionDelegate?.tappedOnMovieCell(movieDataSource[indexPath.row])
    }
}

extension MovieListCollectionViewDelegate: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = LayoutConstant.cellHeight
        return CGSize(width: (collectionView.frame.size.width / 2) - 10, height: height)
    }
}


extension MovieListCollectionViewDelegate: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView)  {
        delegate?.scrollViewDidScroll(scrollView)
    }
}

