//
//  DependencyManager.swift
//  MovieBrwoserWithVIPER
//
//  Created by Tushar on 16/01/19.
//  Copyright © 2019 Tushar. All rights reserved.
//

import Foundation

protocol DependencyManager: class, BuildFactory, UtilityFactory {

    /// Starts dependencies that need to be activated at launch
    func startService()
 }
