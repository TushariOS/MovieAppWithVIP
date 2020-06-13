//
//  HTTPRequest.swift
//  MovieBrwoserWithVIPER
//
//  Created by Tushar on 28/01/19.
//  Copyright © 2019 Tushar. All rights reserved.
//

import Foundation
import Alamofire

public typealias Paramters = [String: Any]
public typealias Headers = [String: String]
public typealias QueryItems = [String: Any]

public struct HTTPRequest {

    /// HTTP Method.
    public let httpMethod: Alamofire.HTTPMethod

    /// HTTP request base URL.
    public let baseURL: URL

    /// HTTP requst path.
    public let path: String

    /// HTTP Query items.
    public let queryItems: QueryItems?

    /// HTTP paramters.
    public let paramters: Paramters?

    /// HTTP headers.
    public let header: Headers?

    /// HTTP endpoint. Combines the base URL and the path to be used for a HTTP call.
    public var endPoint: URL {
        guard var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: false) else {
            return  baseURL.appendingPathComponent(path)
        }

        components.path.append(path)

        let query = queryItems?.map { URLQueryItem(name: $0.key, value: "\($0.value)")}
        components.queryItems = query
        return components.url ?? baseURL.appendingPathComponent(path)
    }

    /// Intilize HTTP a request.
    ///
    /// - Parameters:
    ///   - method: HTTP Methods
    ///   - baseURL: HTTP base URL
    ///   - path: HTTP path
    ///   - queryItems: HTTP query item
    ///   - paramters: HTTP paramters
    ///   - header: HTTP header
    public init(method: Alamofire.HTTPMethod,
                baseURL: URL,
                path: String,
                queryItems: QueryItems?,
                paramters: Paramters?,
                header: Headers?) {
        self.httpMethod = method
        self.baseURL = baseURL
        self.path = path
        self.queryItems = queryItems
        self.paramters = paramters
        self.header = header
    }
}

extension HTTPRequest {

    /// Create new instance with provided query items in additiona to existing
    ///
    /// - Parameter additionalQueryItems: New query items use
    /// - Returns: New instance
    public func with(additionalQueryItems: QueryItems) -> HTTPRequest {
        let newQueryIteam: QueryItems = (queryItems == nil) ? [:] :queryItems!.combineWith(additionalQueryItems)
        return with(newQueryItems: newQueryIteam)
    }

    /// Create new request for updated paramter
    ///
    /// - Parameter newPsramters: New paramters
    /// - Returns: New instance
    public func with(newPsramters: Paramters) -> HTTPRequest {
        return HTTPRequest(method: httpMethod,
                           baseURL: baseURL,
                           path: path,
                           queryItems: queryItems,
                           paramters: newPsramters,
                           header: header)

    }
    /// Cretaed new reuest for updated query items.
    ///
    /// - Parameter newQueryItems: New query items use
    /// - Returns: New instance
    public func with(newQueryItems: QueryItems) -> HTTPRequest {
        return HTTPRequest(method: httpMethod,
                           baseURL: baseURL,
                           path: path,
                           queryItems: newQueryItems,
                           paramters: paramters,
                           header: header)
    }
}


public extension Dictionary {

    /// Adds elements of self to the passed-in dictionary and returns the result
    ///
    /// - Parameters:
    /// - dict: Dictionary to add
    /// - Returns: Result of adding dict's (key, value) pairs to self
    func combineWith<Key: Hashable, Value>(_ dict: [Key: Value]) -> [Key: Value] {
        var result = dict

        for (key, value) in self {
            if let key = key as? Key {
                result[key] = value as? Value
            }
        }

        return result
    }

}
