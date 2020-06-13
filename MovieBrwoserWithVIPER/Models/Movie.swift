//
//  Movie.swift
//  MovieBrwoserWithVIPER
//
//  Created by Tushar on 29/01/19.
//  Copyright © 2019 Tushar. All rights reserved.
//

import Foundation

struct Movie: Codable {
    
    /// Number of vote.
    let voteCount: Int?
    
    /// Movie id.
    let id: Int?
    
    /// Vote average
    let voteAverage: Double?
    
    /// Move title.
    let title: String?
    
    /// Poster path.
    let posterPath: String?
    
    /// Orignal title
    let orginalTitle: String?
    
    /// Overview of movie
    let overview: String?
    
    enum CodingKeys: String, CodingKey {
        case voteCount = "vote_count"
        case id = "id"
        case voteAverage = "vote_average"
        case title = "title"
        case posterPath = "poster_path"
        case orginalTitle = "original_title"
        case overview = "overview"
    }
    
    init(from decoder: Decoder) throws {
        let value = try decoder.container(keyedBy: CodingKeys.self)
        voteCount = try value.decodeIfPresent(Int.self, forKey: .voteCount)
        id = try value.decodeIfPresent(Int.self, forKey: .id)
        voteAverage = try value.decodeIfPresent(Double.self, forKey: .voteAverage)
        title = try value.decodeIfPresent(String.self, forKey: .title)
        posterPath = try value.decodeIfPresent(String.self, forKey: .posterPath)
        orginalTitle = try value.decodeIfPresent(String.self, forKey: .orginalTitle)
        overview = try value.decodeIfPresent(String.self, forKey: .overview)
    }
}
