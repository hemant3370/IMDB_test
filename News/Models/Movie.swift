//
//  Movie.swift
//  IMDB
//
//  Created by Hemant Singh on 28/05/22.
//

import Foundation

internal struct MoviesResponse: Decodable {
    internal let title: String?
    internal let overview: String?
    internal let posterPath: String?
    internal let releaseDate: String?
    internal let rating: Double?
    internal let popularity: Double?
    
    enum CodingKeys: String, CodingKey {
        case title, overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case rating = "vote_average"
    }
}

internal struct Response: Decodable {
    internal let results: [MoviesResponse]?
}

internal struct Movie {
    internal let title: String
    internal let description: String
    internal let urlToImage: URL?
    internal let releaseDate: String
    internal let rating: Double
    internal let popularity: Double
}
