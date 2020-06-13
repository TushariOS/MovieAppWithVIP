//
//  HTTPRequestPerformer.swift
//  MovieBrwoserWithVIPER
//
//  Created by Tushar on 28/01/19.
//  Copyright © 2019 Tushar. All rights reserved.
//

import Foundation

/// Perform HTTP reuest
protocol HTTPRequestPerformer {

    /// Perform provided HTTP reuest
    ///
    /// - Parameters:
    ///   - reuest: HTTP reuest
    ///   - completion: Completion with model with successful, error otherwaise
    func perform<T: Swift.Decodable>(request: HTTPRequest, completion: @escaping (T?, Swift.Error?) -> Void)
    

    /// Perform provided HTTP reuest
    ///
    /// - Parameters:
    ///   - reuest: HTTP reuest
    ///   - completion: Completion with model with successful, error otherwaise
    func perform<T: Swift.Decodable>(request: HTTPRequest, completion: @escaping([T], Swift.Error?)-> Void)


    /// Headers to use for HTTP requests.
    ///
    /// - Parameter environment: Environment.
    /// - Returns: Headers.
    func headers() -> Headers


    func perform(request: HTTPRequest,
                 completion: @escaping (_ response: HTTPResponse?, _ error: Swift.Error?) -> Void)


}
