//
//  HTTPClient.swift
//  MovieBrwoserWithVIPER
//
//  Created by Tushar on 16/02/19.
//  Copyright © 2019 Tushar. All rights reserved.
//

import Foundation

public typealias JSON = [String: Any]

/// HTTP client.
public protocol HTTPClient {

    /// Performs a HTTP request.
    ///
    /// - Parameters:
    ///   - request: The request to use.
    ///   - completion: The completion block.
    func perform(request: HTTPRequest,
                 completion: @escaping (_ response: HTTPResponse?, _ error: Swift.Error?) -> Void)

}

