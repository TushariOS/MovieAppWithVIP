//
//  MovieList.swift
//  MovieBrwoserWithVIPER
//
//  Created by Tushar on 29/01/19.
//  Copyright © 2019 Tushar. All rights reserved.
//

import Foundation

struct MovieResult: Codable {
    
    // MARK:- Properties
    
    /// Movie data.
    let results: [Movie]?
    
    /// Current page
    let page: Int?
    
    /// Total number of movies.
    let totalResults: Int?
    
    /// Total number of pages
    let totalPages: Int?
    
    enum CodingKeys: String, CodingKey {
        case results = "results"
        case page = "page"
        case totalResults = "total_results"
        case totalPages = "total_pages"
    }
    
    init(from decoder: Decoder) throws {
        let value = try decoder.container(keyedBy: CodingKeys.self)
         results = try value.decodeIfPresent([Movie].self, forKey: .results)
         page = try value.decodeIfPresent(Int.self, forKey: .page)
         totalResults = try value.decodeIfPresent(Int.self, forKey: .totalResults)
         totalPages = try value.decodeIfPresent(Int.self, forKey: .totalPages)
    }
}
