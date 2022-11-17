//
//  ActivityIndicatorView.swift
//  Movies
//
//  Created by Alexandru Jdanov on 01.11.2022.
//

import SwiftUI

struct ActivityIndicatorView: UIViewRepresentable {
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {}
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let view = UIActivityIndicatorView(style: .large)
        view.color = .black
        view.startAnimating()
        return view
    }
}
