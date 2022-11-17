//
//  MovieDetailsViewModel.swift
//  Movies
//
//  Created by Alexandru Jdanov on 02.11.2022.
//

import SwiftUI

@MainActor final class MovieDetailsViewModel: ObservableObject {
    
    private let movieService: MovieService
    @Published var movie: Movie?
    
    init(movieService: MovieService = MovieStore.shared) {
        self.movieService = movieService
    }
    
    func loadMovie(id: Int) {
        self.movie = nil
        self.movieService.fetchMovie(id: id) {[weak self] (result) in
            guard let self = self else { return }
            
            switch result {
            case .success(let movie):
                self.movie = movie
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
