//
//  SortingAlertButton.swift
//  Movies
//
//  Created by Alexandru Jdanov on 07.11.2022.
//

import SwiftUI

struct SortingAlertButton {
    enum Variant {
        case destructive
        case regular
        case cancel
    }
    let content: AnyView
    let action: () -> Void
    let type: Variant
    var isDestructive: Bool {
        type == .destructive
    }
    static func destructive<Content: View>(
        @ViewBuilder content: @escaping () -> Content
    ) -> SortingAlertButton {
        SortingAlertButton(
            content: content,
            action: { /* close */ },
            type: .destructive)
    }
    static func regular<Content: View>(
        @ViewBuilder content: @escaping () -> Content,
        action: @escaping () -> Void
    ) -> SortingAlertButton {
        SortingAlertButton(
            content: content,
            action: action,
            type: .regular)
    }
    static func cancel<Content: View>(
        @ViewBuilder content: @escaping () -> Content,
        action: @escaping () -> Void
    ) -> SortingAlertButton {
        SortingAlertButton(
            content: content,
            action: action,
            type: .cancel)
    }
    
    init<Content: View>(
        @ViewBuilder content: @escaping () -> Content,
        action: @escaping () -> Void,
        type: Variant
    ) {
        self.content = AnyView(content())
        self.type = type
        self.action = action
    }
}
