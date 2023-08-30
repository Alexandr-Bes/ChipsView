//
//  ChipsViewModel.swift
//  ChipsView
//
//  Created by AlexBezkopylnyi on 22.08.2023.
//

import SwiftUI

class ChipsViewModel: ObservableObject {
    @Published var chips: [ChipsModel]
    
    init(chips: [ChipsModel] = ChipsMockData) {
        self.chips = chips
    }
    
    func addNew(text: String, color: BasicChipColors) {
        let newChip = ChipsModel(type: .colorImage, text: text, color: color)
        chips.append(newChip)
    }
    
    func remove(at index: Int) {
        chips.remove(at: index)
    }
}


let chipColors: [Color] = [.blue, .yellow, .green, .red, .pink, .purple]
let ChipsMockData = [
    ChipsModel(type: .colorImage, text: "Hello chip", color: .blue),
    ChipsModel(type: .colorImage, text: "Chip-chip", color: .yellow),
    ChipsModel(type: .colorImage, text: "Hey", color: .red),
]
