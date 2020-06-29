//
//  MovieDependencyManager.swift
//  MovieBrwoserWithVIPER
//
//  Created by Tushar on 16/01/19.
//  Copyright © 2019 Tushar. All rights reserved.
//

import Foundation
import Alamofire

class MovieDependencyManager: DependencyManager {

    // MARK: - Properties

    /// Shared Instance
    static let shared = MovieDependencyManager()

    private var sharedRequestManager: RequestManager?
    
    // MARK: - Protocol Conformance

    func startService() {

    }

    public init() {

    }

    func requestManager() -> RequestManager {
        if sharedRequestManager == nil {
            let httpRequestFactory = HTTPRequestFactory()
            let httpRequestPerformenr = MovieHTTPRequestPerformer(httpClient: AlamofireHTTPClient())
            let requestManager = RequestManager(httpRequestFactory: httpRequestFactory, httpRequestPerformer: httpRequestPerformenr)
            return requestManager
        }

        return sharedRequestManager!
    }

    func movieListBuilder() -> MovieListBuilder {
        let builder = MovieListBuilder(dependencyManager: self)
        return builder
    }
    
    func searchViewBuilder() -> SearchBuilder {
        let builder = SearchBuilder(dependencyManager: self)
        return builder
    }
}
