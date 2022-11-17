//
//  MovieDetailsBasicInfoCard.swift
//  Movies
//
//  Created by Alexandru Jdanov on 03.11.2022.
//

import SwiftUI

struct MovieDetailsBasicInfoCard: View {
    
    @State var imageLoader = ImageLoader()
    let movie: Movie
    
    var body: some View {
        HStack(spacing: 10) {
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
            .frame(width: 140, height: 210)
            .cornerRadius(6)
            
            VStack(alignment: .leading, spacing: 10) {
                Text(movie.title)
                    .foregroundColor(.black)
                    .font(Font.event.bold20)
                    .padding(EdgeInsets(top: 10,
                                        leading: 0,
                                        bottom: 0,
                                        trailing: 0))
                
                Text(movie.tagline ?? "")
                    .foregroundColor(Color.fontGray)
                    .font(Font.event.semiBold14)
                Text("Released in \(movie.releaseDate.formatDate())")
                    .foregroundColor(.black)
                    .font(Font.event.semiBold14)
                HStack {
                    Image("ic_star")
                    Text("\(movie.voteAverage.toString()) / 10")
                        .foregroundColor(.black)
                        .font(Font.event.semiBold14)
                    Text("(\(movie.voteCount))")
                        .foregroundColor(Color.fontGray)
                        .font(Font.event.semiBold14)
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        ForEach(movie.genres ?? [], id: \.self) { genre in
                            Text(genre.name)
                                .foregroundColor(.black)
                                .font(Font.event.semiBold12)
                                .fixedSize(horizontal: false, vertical: true)
                                .multilineTextAlignment(.center)
                                .padding()
                                .frame(height: 25)
                                .background(Rectangle()
                                    .fill(Color.background)
                                    .cornerRadius(30))
                        }
                    }
                }
                Spacer()
            }
        }
        .padding(EdgeInsets(top: 0,
                            leading: 10,
                            bottom: -10,
                            trailing: 10))
        .onAppear {
            if let url = movie.posterURL {
                imageLoader.loadImage(with: url)
            }
        }
    }
}

struct MovieDetailsBasicInfoCard_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailsBasicInfoCard(movie: Movie.stubbedMovie)
    }
}
