//
//  UIView+Extension.swift
//  Movies
//
//  Created by Alexandru Jdanov on 05.11.2022.
//

import SwiftUI

extension View {
    func hideKeyboard() {
        let resign = #selector(UIResponder.resignFirstResponder)
        UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
    }
}
