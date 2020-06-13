//
//  UICollectionView+ReusableView.swift
//  MovieBrwoserWithVIPER
//
//  Created by Tushar on 17/01/19.
//  Copyright © 2019 Tushar. All rights reserved.
//

import UIKit

public extension UICollectionView {
    
    /// Dequeue a reusable collection view cell
    ///
    /// - Parameter indexPAth: The index path to use
    /// - Returns: The collection view cell
    func dequeueReusableCell<T: ReusableView>(forIndexPath indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reusableIdentifier, for: indexPath) as? T else {
            fatalError("NO collection view cell could be dequeued with identifier \(T.reusableIdentifier)")
            
        }
        return cell
    }
    
    /// Register the collection view cell based on the given identifer when the cell was created from nib
    ///
    /// - Parameter cellIdentifer: The cell identifier to use.
    func rigsterCellFromNib(cellIdentifer: String) {
        register(UINib(nibName: cellIdentifer, bundle: nil), forCellWithReuseIdentifier: cellIdentifer)
    }
    
    /// Register the collection view cell based on the given identifer when the cell was created from manual layout.
    ///
    /// - Parameter cellClass: The cell class to use
    func reisterCell<T: ReusableView>(cellClass: T.Type) {
        register(T.self, forCellWithReuseIdentifier: T.reusableIdentifier)
    }
}
