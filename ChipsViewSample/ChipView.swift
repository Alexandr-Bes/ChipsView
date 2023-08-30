//
//  ChipView.swift
//  ChipsView
//
//  Created by AlexBezkopylnyi on 22.08.2023.
//

import SwiftUI

enum ChipsViewType {
    case basic
    case color
    case colorImage
}

struct ChipView: View {
    private let circleColor: Color
    private let text: String
    private let type: ChipsViewType
    
    init(circleColor: Color? = nil,
         title: String? = nil,
         type: ChipsViewType = .colorImage) {
        self.circleColor = circleColor ?? .blue
        self.text = title ?? ""
        self.type = type
    }
    
    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            switch type {
            case .basic:
                chipText()
            case .color:
                colorCircle()
                chipText()
            case .colorImage:
                colorCircle()
                chipText()
                crossImage()
            }
        }
        .padding([.leading, .trailing], 9)
        .padding([.top, .bottom], 7)
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(.gray, lineWidth: 1.0)
        )
        
        .transition(.shake(xOffset: -10.0))
//        .transition(.asymmetric(insertion: .scale, removal: .opacity))
//        .animation(Animation.spring(response: 0.8, dampingFraction: 3.0, blendDuration: 1),
//                                    value: viewModel.chips.count)
//        .transition(.asymmetric(insertion: .move(edge: .leading), removal: .push(from: .top)))
    }
    
    @ViewBuilder private func colorCircle() -> some View {
        Circle()
            .fill(circleColor)
            .frame(width: 10, height: 10)
    }
    
    @ViewBuilder private func crossImage() -> some View {
        Image("cross_icon")
    }
    
    @ViewBuilder private func chipText() -> some View {
        Text(text)
            .foregroundColor(Color.black)
            .font(.system(size: 13))
            .lineLimit(1)
            .frame(alignment: .center)
    }
}


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

struct ChipsView_Previews: PreviewProvider {
    static var previews: some View {
        ChipView(title: "Hello world")
    }
}
