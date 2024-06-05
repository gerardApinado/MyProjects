//
//  CustomModifiers.swift
//  SwiftUI-Appetizers
//
//  Created by Gerard on 6/5/24.
//

import SwiftUI

struct StandardButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .buttonStyle(.bordered)
            .tint(Color("brandPrimary"))
            .controlSize(.large)
    }
}

extension View {
    func standardButtonStyle() -> some View {
        self.modifier(StandardButtonStyle())
    }
}
