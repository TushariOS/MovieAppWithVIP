//
//  UtilityFactory.swift
//  MovieBrwoserWithVIPER
//
//  Created by Tushar on 30/01/19.
//  Copyright © 2019 Tushar. All rights reserved.
//

import Foundation

protocol UtilityFactory {

    func requestManager() -> RequestManager
}
