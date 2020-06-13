
//
//  ReusableView.swift
//  MovieBrwoserWithVIPER
//
//  Created by Tushar on 17/01/19.
//  Copyright © 2019 Tushar. All rights reserved.
//

/// Defines a reusable tableview or collectionview cell.
public protocol ReusableView: class {

    /// Default reuse identifier is set with the class name.
    static var reusableIdentifier: String { get}
}

public extension ReusableView {
    static var reusableIdentifier: String {
        return String(describing: self)
    }
}
