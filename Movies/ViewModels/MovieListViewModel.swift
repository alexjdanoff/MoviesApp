//
//  MovieListViewModel.swift
//  Movies
//
//  Created by Alexandru Jdanov on 02.11.2022.
//

import SwiftUI

@MainActor final class MovieListViewModel: ObservableObject {
    
    @Published var selectedIndex: Int = 0
    @Published var movies: [Movie]?
    
    private let movieService: MovieService
    
    init(movieService: MovieService = MovieStore.shared) {
        self.movieService = movieService
    }
    
    enum SortTypes: String {
        
        case ratingAscending
        case ratingDescending
        case releaseDateAscending
        case releaseDateDescending
    }
    
    func loadMovies(with endpoint: MovieListEndpoint) {
        self.movies = nil
        self.movieService.fetchMovies(from: endpoint) { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.movies = response.results
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func loadMovieList() {
        switch selectedIndex {
        case 0:
            self.loadMovies(with: .nowPlaying)
        case 1:
            self.loadMovies(with: .popular)
        case 2:
            self.loadMovies(with: .topRated)
        default:
            self.loadMovies(with: .upcoming)
        }
    }
    
    func sortMovies(by sortTypes: SortTypes) {
        
        switch sortTypes {
        case .ratingAscending:
            movies?.sort {
                $0.voteAverage < $1.voteAverage
            }
            
        case .ratingDescending:
            movies?.sort {
                $0.voteAverage > $1.voteAverage
            }
            
        case .releaseDateAscending:
            movies?.sort {
                $0.releaseDate < $1.releaseDate
            }
            
        case .releaseDateDescending:
            movies?.sort {
                $0.releaseDate > $1.releaseDate
            }
        }
    }
}

