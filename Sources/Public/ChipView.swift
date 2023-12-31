//
//  ChipView.swift
//  
//
//  Created by AlexBezkopylnyi on 31.08.2023.
//  All rights reserved.

import SwiftUI

public struct ChipView: View {
    
    private let circleColor: Color
    private let borderColor: Color
    private let text: String
    private let type: ChipsViewType
    private let showCrossIcon: Bool
    private let appearEffect: ChipAppearAnimation?
    
    var action: (()->())?
    
    public init(
        circleColor: Color? = nil,
        borderColor: Color? = nil,
        text: String? = nil,
        type: ChipsViewType = .circleColor,
        showClose: Bool = true,
        appearEffect: ChipAppearAnimation? = .shake,
        action: (()->())? = nil)
    {
        self.circleColor = circleColor ?? .blue
        self.borderColor = borderColor ?? .gray
        self.text = text ?? ""
        self.type = type
        self.showCrossIcon = showClose
        self.appearEffect = appearEffect
        self.action = action
    }
    
    public var body: some View {
        HStack(alignment: .center, spacing: 10) {
            switch type {
            case .basic:
                chipText()
            case .circleColor:
                colorCircle()
                chipText()
            }
            
            if showCrossIcon {
                crossImage()
            }
            
        }
        .padding([.leading, .trailing], 9)
        .padding([.top, .bottom], 7)
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(borderColor, lineWidth: 1.0)
        )
        .transition(transition)
        .onTapGesture {
            action?()
        }
    }
}

private extension ChipView {
    @ViewBuilder func colorCircle() -> some View {
        Circle()
            .fill(circleColor)
            .frame(width: 10, height: 10)
    }
    
    @ViewBuilder func crossImage() -> some View {
        Image("cross_icon", bundle: Bundle.module)
    }
    
    @ViewBuilder func chipText() -> some View {
        Text(text)
            .foregroundColor(Color.black)
            .font(.system(size: 13))
            .lineLimit(1)
            .frame(alignment: .center)
    }
}

private extension ChipView {
    var transition: AnyTransition {
        guard let appearEffect = appearEffect else {
            return AnyTransition.identity
        }
        
        switch appearEffect {
        case .zoomIn:
            return .zoomIn
        case .zoomOut:
            return .zoomOut
        case .shake:
            return .shake(xOffset: 8)
        case .opacity:
            return .opacityType
        }
    }
}


private struct ChipsView_Previews: PreviewProvider {
    static var previews: some View {
        ChipView(text: "Hello world")
    }
}
