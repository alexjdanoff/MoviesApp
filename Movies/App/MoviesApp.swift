//
//  MoviesApp.swift
//  Movies
//
//  Created by Alexandru Jdanov on 31.10.2022.
//

import SwiftUI

@main
struct MoviesApp: App {
    var body: some Scene {
        WindowGroup {
            MainTabBarView()
                .environmentObject(FavoritesViewModel())
        }
    }
}
