//
//  MovieDetailsImage.swift
//  Movies
//
//  Created by Alexandru Jdanov on 03.11.2022.
//

import SwiftUI

struct MovieDetailsImage: View {
    
    @State var imageLoader = ImageLoader()
    let movie: Movie
    
    var body: some View {
        ZStack {
            Rectangle().fill(Color.gray.opacity(0.3))
            if let image = imageLoader.image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } else {
                ActivityIndicatorView()
            }
        }
        .onAppear {
            if let url = movie.backdropURL {
                imageLoader.loadImage(with: url)
            }
        }
    }
}
