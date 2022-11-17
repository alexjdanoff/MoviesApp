//
//  Movie.swift
//  Movies
//
//  Created by Alexandru Jdanov on 31.10.2022.
//

import Foundation

struct MovieResponse: Decodable {
    
    let results: [Movie]
}


struct Movie: Codable, Identifiable {
    
    let id: Int
    let title: String
    let posterPath: String?
    let backdropPath: String?
    let overview: String
    let voteAverage: Double
    let voteCount: Int
    let runtime: Int?
    let releaseDate: String
    let tagline: String?
    let genres: [Genre]?
    
    struct Genre: Codable, Hashable {
        var id: Int
        var name: String
    }
    
    var posterURL: URL? {
        return URL(string: "https://image.tmdb.org/t/p/w500\(posterPath ?? "")")
    }
    
    var backdropURL: URL? {
        return URL(string: "https://image.tmdb.org/t/p/w500\(backdropPath ?? "")")
    }
}


