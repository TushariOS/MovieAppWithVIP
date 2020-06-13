//
//  RequestManager.swift
//  MovieBrwoserWithVIPER
//
//  Created by Tushar on 24/01/19.
//  Copyright © 2019 Tushar. All rights reserved.
//

import Foundation

public final class RequestManager {
    
    /// HTTP Request factory.
    let httpRequestFactory: HTTPRequestFactory
    
    /// HTTP request performer.
    let httpRequestPerformer: HTTPRequestPerformer
    
    init(httpRequestFactory: HTTPRequestFactory, httpRequestPerformer: HTTPRequestPerformer) {
        self.httpRequestFactory = httpRequestFactory
        self.httpRequestPerformer = httpRequestPerformer
    }
    
    /// Perform HTTP request along with other behaviors specific to requests.
    ///
    /// - Parameters:
    ///   - requestType: Request
    ///   - compleation: Compleation with model when successful, otherwaise error
    
    func perform<T: Swift.Decodable>(requetType: HTTPRequestType, compleation: @escaping (T?, Error?) -> Void) {
        
        let reuest = httpRequestFactory.reuest(ofType: requetType)
        let thenResolveResponse: (T?, Swift.Error?) -> Void = { [weak self] (model, originalError) in
                print("error", originalError)
                compleation(model, nil)
            }

            httpRequestPerformer.perform(request: reuest, completion: thenResolveResponse)
            // httpRequestPerformer.perform(request: reuest, completion: thenResolveResponse)
        }


        /// Perform HTTP request along with other behaviors specific to requests.
        ///
        /// - Parameters:
        ///   - requestType: Request
        ///   - compleation: Compleation with model when successful, otherwaise error
        func perform<T: Swift.Decodable>(requestType: HTTPRequestType, compleation: @escaping ([T]?, Error?) -> Void) {
            let request = httpRequestFactory.reuest(ofType: requestType)
            let thenResolveResponse: ([T]?, Swift.Error?) -> Void = {
                [weak self] (model, error) in
                compleation(model, nil)
            }

            // httpRequestPerformer.perform(request: request, completion: thenResolveResponse)
            httpRequestPerformer.perform(request: request, completion: thenResolveResponse)
        }
    }

// MARK: - MovieService

// Implementing Movie sercie protocol
extension RequestManager: MovieService {
    func getMovies(page: Int, compleation: @escaping (MovieResult?, Error?) -> Void) {
        perform(requetType: .getMovies(page: page), compleation: compleation)
    }
}
