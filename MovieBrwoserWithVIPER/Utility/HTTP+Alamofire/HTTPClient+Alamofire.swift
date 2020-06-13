//
//  HTTPClient+Alamofire.swift
//  MovieBrwoserWithVIPER
//
//  Created by Tushar on 16/02/19.
//  Copyright © 2019 Tushar. All rights reserved.
//

import Foundation

import Alamofire

public extension HTTPClient {

    public func perform(request: HTTPRequest,
                        completion: @escaping (_ response: HTTPResponse?, _ error: Swift.Error?) -> Void) {
        Alamofire.request(request.endPoint,
                          method: request.httpMethod,
                          parameters: nil,
                          encoding: JSONEncoding.default,
                          headers: nil)
            .responseJSON { (response: DataResponse<Any>) in
                print("-----------------------------------------")
                print("JSON Request: \(response.request)")
             //   print("JSON Response: \(response.value)")
                print("------------------------------------------")
                if response.result.isSuccess {
                    self.handleSuccessfulResponse(response, completion: completion)
                } else {
                    self.handleUnsuccessfulResponse(response, completion: completion)
                }
        }
    }

    private func handleSuccessfulResponse(_ response: DataResponse<Any>,
                                          completion: @escaping (HTTPResponse?, Swift.Error?) -> Void) {
        let httpResponse = HTTPResponse(data: response.data,
                                        statusCode: response.response?.statusCode)
        completion(httpResponse, response.error)
    }

    private func handleUnsuccessfulResponse(_ response: DataResponse<Any>,
                                            completion: @escaping (HTTPResponse?, Swift.Error?) -> Void) {
        if let responseData = response.data {
            completion(nil, try? JSONDecoder().decode(MovieError.self, from: responseData))
        } else {
            let httpResponse = HTTPResponse(data: response.data,
                                            statusCode: response.response?.statusCode)
            completion(httpResponse, response.error)
        }
    }

}
