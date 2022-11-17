//
//  Constants.swift
//  Movies
//
//  Created by Alexandru Jdanov on 31.10.2022.
//

import Foundation

struct K {
    
    struct TabBar {
        
        static let icons = [
            "ic_favorites",
            "ic_home",
            "ic_search"
        ]
        
        static let pressedIcons = [
            "ic_favorites_press",
            "ic_home_press",
            "ic_search_press"
        ]
        
        static let titles = [
            "Favorites",
            "Home",
            "Search"
        ]
        
        static let topButtons = [
            "Now playing",
            "Popular",
            "Top rated",
            "Upcoming"
        ]
    }
    
    struct SortButtons {
        static let titles = [
            "Rating ascending",
            "Rating descending",
            "Release date ascending",
            "Release date descending"
        ]
    }
}
