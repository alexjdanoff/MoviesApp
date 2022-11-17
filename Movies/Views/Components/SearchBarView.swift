//
//  SearchBarView.swift
//  Movies
//
//  Created by Alexandru Jdanov on 04.11.2022.
//

import SwiftUI

struct SearchBarView: View {
    
    @Binding var searchText: String
    @Binding var searching: Bool
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color.white)
            HStack {
                TextField("", text: $searchText) { startedEditing in
                    if startedEditing {
                        withAnimation {
                            searching = true
                        }
                    }
                } onCommit: {
                    withAnimation {
                        searching = false
                    }
                }
                .foregroundColor(.black)
                .padding(.leading, 25)
                
            }
            .background(
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.black)
                    Text(searchText.isEmpty ? "Search movies" : "")
                        .foregroundColor(.black)
                        .opacity(0.4)
                    
                    Spacer()
                })
            .accentColor(.black)
            .foregroundColor(.black)
            .padding(.leading, 13)
        }
        .frame(height: 40)
        .cornerRadius(10)
        .padding()
    }
}
