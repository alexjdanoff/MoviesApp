//
//  MovieDetailsView.swift
//  Movies
//
//  Created by Alexandru Jdanov on 02.11.2022.
//

import SwiftUI

struct MovieDetailsView: View {
    
    let movieId: Int
    @ObservedObject private var viewModel = MovieDetailsViewModel()
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        VStack {
            ScrollView {
                if let movie = viewModel.movie {
                    MovieDetailsImage(movie: movie)
                    MovieDetailsBasicInfoCard(movie: movie)
                    
                    Divider()
                        .frame(height: 2)
                        .background(Color.background)
                        .padding()
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Released in \(movie.releaseDate.formatDate())")
                            .foregroundColor(.black)
                            .font(Font.event.bold16)
                        Text(movie.overview)
                            .foregroundColor(.black)
                            .font(Font.event.semiBold14)
                    }
                    .padding(EdgeInsets(top: -10,
                                        leading: 10,
                                        bottom: 0,
                                        trailing: 10))
                }
            }
        }
        .background(Color.white)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading)  {
                HStack {
                    Image(systemName: "chevron.backward")
                        .foregroundColor(.white)
                    Text("Back")
                }
                .onTapGesture {
                    self.presentation.wrappedValue.dismiss()
                }
            }
            
            ToolbarItem(placement: .principal) {
                Text(viewModel.movie?.title ?? "")
                    .font(Font.headline.weight(.semibold))
            }
        }
        .navigationBarBackButtonHidden(true)
        .onAppear {
            viewModel.loadMovie(id: movieId)
        }
    }
}

struct MovieDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailsView(movieId: Movie.stubbedMovie.id)
    }
}
