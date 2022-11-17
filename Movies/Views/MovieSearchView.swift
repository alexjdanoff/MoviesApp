//
//  MovieSearchView.swift
//  Movies
//
//  Created by Alexandru Jdanov on 31.10.2022.
//

import SwiftUI

struct MovieSearchView: View {
    
    @StateObject private var viewModel = MovieSearchViewModel()
    @State private var columns = [GridItem(.adaptive(minimum: 180))]
    @State var isSearching: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                VStack(spacing: 0) {
                    SearchBarView(searchText: $viewModel.query, searching: $isSearching)
                    Spacer()
                }
                .frame(height: 90)
                .background(Color.black)
                
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(viewModel.movies ?? []) { movie in
                            MovieBackdropCard(movie: movie)
                                .cornerRadius(6)
                        }
                    }
                }
            }
            .background(Color.background)
        }
        .onAppear {
            viewModel.startObserve()
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        MovieSearchView()
    }
}


