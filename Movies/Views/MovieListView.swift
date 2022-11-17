//
//  MovieListView.swift
//  Movies
//
//  Created by Alexandru Jdanov on 31.10.2022.
//

import SwiftUI

struct MovieListView: View {
    
    @StateObject private var viewModel = MovieListViewModel()
    @State private var columns = [GridItem(.adaptive(minimum: 180))]
    @State private var isShowingAlert = false
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 30) {
                            ForEach(0..<4, id: \.self) { number in
                                Button(action: {
                                    viewModel.selectedIndex = number
                                    viewModel.loadMovieList()
                                }, label: {
                                    if viewModel.selectedIndex == number {
                                        Text(K.TabBar.topButtons[number])
                                            .foregroundColor(.white)
                                            .font(Font.event.semiBold14)
                                            .overlay(
                                                Rectangle()
                                                    .frame(width: 100, height: 4)
                                                    .offset(y: 15)
                                                    .foregroundColor(.white),
                                                alignment: .bottom)
                                    } else {
                                        Text(K.TabBar.topButtons[number])
                                            .foregroundColor(.white)
                                            .font(Font.event.semiBold14)
                                    }
                                })
                            }
                        }
                        .padding()
                    }
                    .frame(height: 50)
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
                .navigationTitle("Home")
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
        .accentColor(.white)
        .onAppear {
            viewModel.loadMovieList()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
