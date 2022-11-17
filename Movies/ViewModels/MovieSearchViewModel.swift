//
//  MovieSearchViewModel.swift
//  Movies
//
//  Created by Alexandru Jdanov on 04.11.2022.
//

import Foundation
import Combine

@MainActor final class MovieSearchViewModel: ObservableObject {
    
    @Published var movies: [Movie]?
    @Published var query = ""
    
    private var subscriptionToken: AnyCancellable?
    private let movieService: MovieService
    
    var isEmptyResults: Bool {
        !self.query.isEmpty && self.movies != nil && self.movies!.isEmpty
    }
    
    init(movieService: MovieService = MovieStore.shared) {
        self.movieService = movieService
    }
    
    func startObserve() {
        guard subscriptionToken == nil else { return }
        
        self.subscriptionToken = self.$query
            .map { [weak self] text in
                self?.movies = nil
                return text
                
            }.throttle(for: 1, scheduler: DispatchQueue.main, latest: true)
            .sink { [weak self] in self?.search(query: $0) }
    }
    
    func search(query: String) {
        self.movies = nil
        
        guard !query.isEmpty else {
            return
        }
        
        self.movieService.searchMovie(query: query) {[weak self] (result) in
            guard let self = self, self.query == query else { return }
            
            switch result {
            case .success(let response):
                self.movies = response.results
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    deinit {
        self.subscriptionToken?.cancel()
        self.subscriptionToken = nil
    }
}
