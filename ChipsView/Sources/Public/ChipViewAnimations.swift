//
//  ChipViewAnimations.swift
//  
//
//  Created by AlexBezkopylnyi on 31.08.2023.
//  All rights reserved.

import SwiftUI

struct ShakeAnimation: GeometryEffect {
    func effectValue(size: CGSize) -> ProjectionTransform {
        return ProjectionTransform(CGAffineTransform(translationX: position, y: 0))
    }
    
    var position: CGFloat
    var animatableData: CGFloat {
        get { position }
        set { position = newValue }
    }
}

struct ShakeAnimationAlt: GeometryEffect {
    func effectValue(size: CGSize) -> ProjectionTransform {
        return ProjectionTransform(CGAffineTransform(translationX: -8 * sin(position * 2 * .pi), y: 0))
    }
    
    init(shakes: Int) {
        self.position = CGFloat(shakes)
    }
    
    var position: CGFloat
    var animatableData: CGFloat {
        get { position }
        set { position = newValue }
    }
}

extension AnyTransition {
    static var zoomOut: AnyTransition {
        return .scale(scale: 2, anchor: .center)
    }
    
    static var zoomIn: AnyTransition {
        return .scale(scale: 0.5, anchor: .center)
    }
    
    static var opacityType: AnyTransition {
        return .opacity.animation(Animation.linear(duration: 0.7))
    }
    
    static func shake(xOffset: CGFloat) -> AnyTransition {
        let transition = AnyTransition.modifier(active: ShakeAnimation(position: xOffset),
                                                identity: ShakeAnimation(position: 0))
            .animation(.interpolatingSpring(mass: 0.1, stiffness: 12, damping: 0.5).speed(2))
        return .asymmetric(insertion: transition, removal: transition)
    }
    
    static func shakeAlt(shakes: Int) -> AnyTransition {
        let transition = AnyTransition.modifier(active: ShakeAnimationAlt(shakes: shakes),
                                                identity: ShakeAnimationAlt(shakes: 0))
            .animation(.linear(duration: 1.2))
        return .asymmetric(insertion: transition, removal: transition)
    }
    
    //    static func shake(xOffset: CGFloat) -> AnyTransition {
    //        let transition = AnyTransition.modifier(active: ShakeTransitionType(xOffset: xOffset),
    //                                                identity: ShakeTransitionType(xOffset: xOffset))
    //        return .asymmetric(insertion: transition, removal: transition)
    //    }
}


/*
struct ShakeTransitionType: ViewModifier {
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
*/
