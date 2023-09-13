//
//  ChipViewAnimations.swift
//  
//
//  Created by AlexBezkopylnyi on 31.08.2023.
//  All rights reserved.

import SwiftUI

struct ShakeTransition: ViewModifier {
    @State private var isAnimating = false
    var xOffset: CGFloat
    
    func body(content: Content) -> some View {
        content
            .offset(x: isAnimating ? xOffset : 0)
            .animation(.interpolatingSpring(mass: 0.1, stiffness: 12, damping: 0.5), value: isAnimating)
            .onAppear {
                self.isAnimating = true
            }
    }
}

extension AnyTransition {
    static func shake(xOffset: CGFloat) -> AnyTransition {
        let transition = AnyTransition.modifier(active: ShakeTransition(xOffset: xOffset),
                                                identity: ShakeTransition(xOffset: xOffset))
        return .asymmetric(insertion: transition, removal: transition)
    }
}
