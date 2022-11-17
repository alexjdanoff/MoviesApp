//
//  FavoritesView.swift
//  Movies
//
//  Created by Alexandru Jdanov on 31.10.2022.
//

import SwiftUI

struct FavoritesView: View {
    
    @EnvironmentObject private var viewModel: FavoritesViewModel
    @State private var columns = [GridItem(.adaptive(minimum: 180))]
    @State private var isShowingAlert = false
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(viewModel.movies) { movie in
                                MovieBackdropCard(movie: movie)
                                    .cornerRadius(6)
                            }
                        }
                    }
                }
                .background(Color.background)
                .navigationTitle("Favorites")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            self.isShowingAlert = true
                        }) {
                            Image("ic_sort")
                        }
                    }
                }
                
                SortingAlertView(isShowing: $isShowingAlert,
                                 buttons: [
                                    SortingAlertButton(content: {
                                        Text(K.SortButtons.titles[0])
                                            .foregroundColor(.black)
                                            .font(Font.event.semiBold14)
                                    }, action: {
                                        viewModel.sortMovies(by: .ratingAscending)
                                    }, type: .regular),
                                    
                                    SortingAlertButton(content: {
                                        Text(K.SortButtons.titles[1])
                                            .foregroundColor(.black)
                                            .font(Font.event.semiBold14)
                                    }, action: {
                                        viewModel.sortMovies(by: .ratingDescending)
                                    }, type: .regular),
                                    
                                    SortingAlertButton(content: {
                                        Text(K.SortButtons.titles[2])
                                            .foregroundColor(.black)
                                            .font(Font.event.semiBold14)
                                    }, action: {
                                        viewModel.sortMovies(by: .releaseDateAscending)
                                    }, type: .regular),
                                    
                                    SortingAlertButton(content: {
                                        Text(K.SortButtons.titles[3])
                                            .foregroundColor(.black)
                                            .font(Font.event.semiBold14)
                                    }, action: {
                                        viewModel.sortMovies(by: .releaseDateDescending)
                                    }, type: .regular)
                                 ]
                )
            }
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
            .environmentObject(FavoritesViewModel())
    }
}
