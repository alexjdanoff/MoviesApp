//
//  FavoritesViewModel.swift
//  Movies
//
//  Created by Alexandru Jdanov on 05.11.2022.
//

import SwiftUI

@MainActor final class FavoritesViewModel: ObservableObject {
    
    @Published var movies: [Movie] = [] {
        didSet {
            saveMovies()
        }
    }
    private let defaults = UserDefaults.standard
    private let moviesKey: String = "Favorites"
    
    init() {
        getMovies()
    }
    
    enum SortTypes: String {
        
        case ratingAscending
        case ratingDescending
        case releaseDateAscending
        case releaseDateDescending
    }
    
    func getMovies() {
        guard
            let data = defaults.data(forKey: moviesKey),
            let savedMovies = try? JSONDecoder().decode([Movie].self, from: data)
        else { return }
        
        self.movies = savedMovies
    }
    
    func contains(_ movie: Movie) -> Bool {
        var contains: Bool = false
        
        movies.forEach {
            guard $0.id == movie.id else { return }
            contains = true
        }
        
        return contains
    }
    
    func add(_ movie: Movie) {
        movies.append(movie)
    }
    
    func remove(_ movie: Movie) {
        movies.removeAll { $0.id == movie.id }
    }
    
    func saveMovies() {
        if let encoded = try? JSONEncoder().encode(movies) {
            defaults.set(encoded, forKey: moviesKey)
        }
    }
    
    func sortMovies(by sortTypes: SortTypes) {
        
        switch sortTypes {
        case .ratingAscending:
            movies.sort {
                $0.voteAverage < $1.voteAverage
            }
            
        case .ratingDescending:
            movies.sort {
                $0.voteAverage > $1.voteAverage
            }
            
        case .releaseDateAscending:
            movies.sort {
                $0.releaseDate < $1.releaseDate
            }
            
        case .releaseDateDescending:
            movies.sort {
                $0.releaseDate > $1.releaseDate
            }
        }
    }
}
