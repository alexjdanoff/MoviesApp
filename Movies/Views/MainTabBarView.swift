//
//  ContentView.swift
//  Movies
//
//  Created by Alexandru Jdanov on 31.10.2022.
//

import SwiftUI

struct MainTabBarView: View {
    @State private var selectedIndex: Int = 1
    
    var body: some View {
        VStack {
            ZStack {
                switch selectedIndex {
                case 0:
                    FavoritesView()
                    
                case 1:
                    MovieListView()
                    
                default:
                    MovieSearchView()
                }
            }
            
            Spacer()
            Divider()
            
            HStack {
                ForEach(0..<3, id: \.self) { number in
                    Spacer()
                    Button(action: {
                        self.selectedIndex = number
                    }, label: {
                        VStack(spacing: 1) {
                            Image(selectedIndex == number ? K.TabBar.pressedIcons[number] : K.TabBar.icons[number])
                            Text(K.TabBar.titles[number])
                                .font(.system(size: 10, weight: .semibold))
                                .foregroundColor(selectedIndex == number ? .white : .gray)
                        }
                    })
                    
                    Spacer()
                }
            }
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabBarView()
    }
}
