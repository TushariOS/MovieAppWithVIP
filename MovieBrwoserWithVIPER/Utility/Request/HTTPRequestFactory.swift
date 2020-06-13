//
//  HTTPRequestFactory.swift
//  MovieBrwoserWithVIPER
//
//  Created by Tushar on 29/01/19.
//  Copyright © 2019 Tushar. All rights reserved.
//

import Foundation

public struct HTTPRequestFactory {

    func baseURL() -> URL {
        guard let baseURL = URL(string: BusinessConstants.URLConstant.baseURL) else {
            fatalError("Base url")
        }
        return  baseURL
    }

    func  header() -> Headers {
        return ["Content-type" : "application/json"]
    }

    func reuest(ofType requestType: HTTPRequestType) -> HTTPRequest {
        switch requestType {
        case .getMovies(let page):
            print("get movie")
            return getMovieList(page: page)
        }
    }

    private func getMovieList(page: Int) -> HTTPRequest {
        let path = BusinessConstants.URLConstant.getMovieListURL
        let paramter = ["page" : page,
                        "api_key" : BusinessConstants.URLConstant.api_key] as [String : Any]
        return HTTPRequest(method: .get,
                           baseURL: baseURL(),
                           path: path,
                           queryItems: paramter,
                           paramters: nil,
                           header: nil)
    }
}
