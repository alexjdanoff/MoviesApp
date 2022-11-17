//
//  MovieBackdropCard.swift
//  Movies
//
//  Created by Alexandru Jdanov on 01.11.2022.
//

import SwiftUI

struct MovieBackdropCard: View {
    
    let movie: Movie
    @EnvironmentObject private var favorites: FavoritesViewModel
    @StateObject private var imageLoader = ImageLoader()
    @State private var isActive: Bool = false
    
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                
                if let image = self.imageLoader.image {
                    NavigationLink(destination: MovieDetailsView(movieId: movie.id),
                                   isActive: $isActive) {
                        Image(uiImage: image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            
                        
                    }
                } else {
                    ActivityIndicatorView()
                }
            }
            .frame(width: 180, height: 270)
            .cornerRadius(6)
            .padding(EdgeInsets(top: 2,
                                leading: 2,
                                bottom: 0,
                                trailing: 2))
            
            Spacer()
            
            HStack {
                Text(movie.releaseDate.formatDate())
                    .foregroundColor(.black)
                    .font(Font.event.semiBold14)
                    .frame(maxWidth: .infinity)
                
                HStack(spacing: 5) {
                    Image("ic_star")
                    Text(movie.voteAverage.debugDescription)
                        .foregroundColor(.black)
                        .font(Font.event.semiBold14)
                }
                .frame(maxWidth: .infinity)
                
                Button(action: {
                    if (favorites.contains(movie)) {
                        favorites.remove(movie)
                    } else {
                        favorites.add(movie)
                    }
                    
                }) {
                    Image(favorites.contains(movie) ? "ic_add_to_favorites_red" : "ic_add_to_favorites_black")
                }
                .frame(maxWidth: .infinity)
            }
            
            Spacer()
            
        }
        .frame(width: 184, height: 310)
        .background(Color.white)
        .onAppear {
            if let url = self.movie.posterURL {
                self.imageLoader.loadImage(with: url)
            }
        }
        
        .onChange(of: isActive) { newValue in
            if newValue {
                hideKeyboard()
            }
        }
    }
    
    
}

struct MovieBackdropCard_Previews: PreviewProvider {
    static var previews: some View {
        MovieBackdropCard(movie: Movie.stubbedMovie)
    }
}
