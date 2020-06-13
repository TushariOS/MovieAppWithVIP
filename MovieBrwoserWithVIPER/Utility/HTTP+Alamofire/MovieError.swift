//
//  MovieError.swift
//  MovieBrwoserWithVIPER
//
//  Created by Tushar on 16/02/19.
//  Copyright © 2019 Tushar. All rights reserved.
//

import Foundation

/**
 *  PCFError model.
 */
public struct MovieError: Error, Swift.Decodable {

    /// An error identifier used for API error.
    public let code: Int

    /// A human (end user friendly) readable/comprehensible description of the error.
    public let message: String

    /// Initializes a PCF error.
    ///
    /// - Parameters:
    ///   - code: The error code to use.
    ///   - message: The error message to use.
    public init(code: Int, message: String) {
        self.code = code
        self.message = message
    }

}

// MARK: - Default errors
public extension MovieError {

    /// Error for mal-formatted JSON, such as receiving arrays when expecting dictionaries as response.
    public static var invalidJSON: MovieError {
        return MovieError(code: -1, message: "Invalid JSON response")
    }

}

// MARK: - Equatable
extension MovieError: Equatable {}

public func == (_ lhs: MovieError, _ rhs: MovieError) -> Bool {
    return lhs.code == rhs.code
}
