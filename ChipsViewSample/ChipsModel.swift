//
//  ChipsModel.swift
//  ChipsView
//
//  Created by AlexBezkopylnyi on 22.08.2023.
//

import SwiftUI
import ChipsView

struct SampleChipModel: ChipModel {
    let id = UUID().uuidString
    let type: ChipsViewType
    let text: String
    let color: Color// BasicChipColors
}

enum BasicChipColors: CaseIterable, Identifiable {
    var id: Self { self }
    
    case blue
    case yellow
    case green
    case red
    case pink
    case purple
    
    var value: Color {
        switch self {
        case .blue: return .blue
        case .yellow: return .yellow
        case .green: return .green
        case .red: return .red
        case .pink: return .pink
        case .purple: return .purple
        }
    }
    
    var text: String {
        switch self {
        case .blue: return "Blue"
        case .yellow: return "Yellow"
        case .green: return "Green"
        case .red: return "Red"
        case .pink: return "Pink"
        case .purple: return "Purple"
        }
    }
}
