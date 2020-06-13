//
//  MovieHTTPRequestPerformer.swift
//  MovieBrwoserWithVIPER
//
//  Created by Tushar on 13/02/19.
//  Copyright © 2019 Tushar. All rights reserved.
//

import Foundation
import Alamofire

public class MovieHTTPRequestPerformer: HTTPRequestPerformer {

    func perform<T>(request: HTTPRequest, completion: @escaping ([T], Error?) -> Void) where T : Decodable {
        httpClient.perform(request: request) { (response, error) in
            if let error = error {

            } else {

                self.decodeDataArray(response?.data, completion: completion)
            }
        }

    }



//    func perform<T>(request: HTTPRequest, completion: @escaping ([T], Error) -> Void) where T : Decodable {
//
//    }
//
//    func headers() -> Headers {
//
//    }

//    func perform(request: HTTPRequest, completion: @escaping (T?, Error?) -> Void) {
//        httpClient.perform(request: request) { (response, error) in
//            if let error = error {
//            } else {
//                self.decodeResponse((response, error), completion: completion)
//
//                //self.decodeData(response?.data, completion: completion)
//            }
//        }
//
//    }


//    func perform<T>(request: HTTPRequest, completion: @escaping ([T], Error) -> Void) where T : Decodable {
//
//    }


    /// The JSON Decoder used to perform JSON Decoding of underlying models

    public let httpClient: HTTPClient
    public let decoder: JSONDecoder


    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
        self.decoder = JSONDecoder()
    }

    func perform(request: HTTPRequest, completion: @escaping (HTTPResponse?, Error?) -> Void) {

        Alamofire.request(request.endPoint,
                          method: request.httpMethod,
                          parameters: nil,
                          encoding: JSONEncoding.default,
                          headers: nil)
            .responseJSON { ( response) in
                print("-----------------------------------------")
                print("JSON Request: \(response.request)")
            //    print("JSON Response: \(response.value)")
                print("------------------------------------------")
                if response.result.isSuccess {
                    // self.handleSuccessfulResponse(response, completion: completion)
                    // self.decodeResponse((response, error), completion: completion)
                } else {
                    self.handleUnsuccessfulResponse(response, completion: completion)
                }
        }

    }

    /// Performs the given HTTP request for returning a single object.
    ///
    /// - Parameters:
    ///   - request: The request to perform.
    ///   - completion: The completion block.

    public func perform<T: Swift.Decodable>(request: HTTPRequest, completion: @escaping (T?, Swift.Error?) -> Void) {

            httpClient.perform(request: request) { (response, error) in
                if let error = error {
                    
                    } else {
                    self.decodeData(response?.data, completion: completion)
                }
            }
    }


    /// Performs the given HTTP request for returning an array of objects.
    ///
    /// - Parameters:
    ///   - request: The request to perform.
    ///   - completion: The completion block.
    public func perform<T: Swift.Decodable>(request: HTTPRequest, completion: @escaping ([T]?, Swift.Error?) -> Void) {
            httpClient.perform(request: request) { (response, error) in
                if let error = error {
                    
                } else {
                    self.decodeDataArray(response?.data, completion: completion)
                }
            }
        }

  /*  func perform<T>(reuest: HTTPRequest, completion: @escaping (T?, Error) -> Void) where T : Decodable {
        Alamofire.request(reuest.endPoint,
                          method: reuest.httpMethod,
                          parameters: nil,
                          encoding: JSONEncoding.default,
                          headers: nil)
            .responseJSON { (response: DataResponse<Any>) in
                print("-----------------------------------------")
                print("JSON Request: \(response.request)")
                print("JSON Response: \(response.value)")
                print("------------------------------------------")
                if response.result.isSuccess {
                    self.handleSuccessfulResponse(response, completion: completion)
                    //self.decodeResponse((response, nil), completion: completion)
                } else {
                    //  self.handleUnsuccessfulResponse(response, completion: completion)
                }
                90
        }

    }

    func perform<T>(reuest: HTTPRequest, completion: @escaping ([T], Error) -> Void) where T : Decodable {
        Alamofire.request(reuest.endPoint,
                          method: reuest.httpMethod,
                          parameters: reuest.paramters,
                          encoding: JSONEncoding.default,
                          headers: reuest.header)
            .responseJSON { (response: DataResponse<Any>) in
                print("-----------------------------------------")
                print("JSON Request: \(response.request)")
                print("JSON Response: \(response.value)")
                print("------------------------------------------")
        }

    } */

    func headers() -> Headers {
        return ["test": "test"]
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
            //   completion(nil, try? JSONDecoder().decode(nil, from: responseData))
        } else {
            let httpResponse = HTTPResponse(data: response.data,
                                            statusCode: response.response?.statusCode)
            completion(httpResponse, response.error)
        }
    }



    private func decodeResponse<T: Swift.Decodable>(_ response: (details: HTTPResponse?, error: Swift.Error?),
                                                    completion: @escaping (T?, Swift.Error?) -> Void) {
        if let error = response.error {
            completion(nil, error)
        } else {
            decodeData(response.details?.data, completion: completion)
        }
    }


    private func decodeData<T: Swift.Decodable>(_ data: Any?, completion: @escaping (T?, Swift.Error?) -> Void) {
        guard let data = data as? Data else {
            completion(nil, nil)
            return
        }

        do {
            let decoder = JSONDecoder()
            let model = try decoder.decode(T.self, from: data)
            completion(model, nil)
        } catch {
            completion(nil, error)
        }
    }

private func decodeDataArray<T: Swift.Decodable>(_ data: Any?, completion: @escaping ([T], Swift.Error?) -> Void) where T : Decodable  {
    guard let data = data as? Data else {
        completion([], MovieError.invalidJSON)
        return
    }

    do {
        let decoder = JSONDecoder()
        let model = try decoder.decode([T].self, from: data)
        completion(model, nil)
    } catch {
        completion([], MovieError.invalidJSON)
    }
}


}

public struct HTTPResponse {

    // MARK: - Properties

    /// Data.
    public let data: Any

    /// Status code.
    public let statusCode: Int?

    // MARK: - Initalizers

    public init(data: Any, statusCode: Int?) {
        self.data = data
        self.statusCode = statusCode
    }

}
