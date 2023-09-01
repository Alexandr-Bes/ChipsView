//
//  ChipsViewModel.swift
//  ChipsView
//
//  Created by AlexBezkopylnyi on 22.08.2023.
//

import SwiftUI

class ChipsViewModel: ObservableObject {
    @Published var chips: [SampleChipModel]
    
    init(chips: [SampleChipModel] = ChipsMockData) {
        self.chips = chips
    }
    
    func addNew(text: String, color: BasicChipColors) {
        let newChip = SampleChipModel(type: .circleColor, text: text, color: color.value)
        chips.append(newChip)
    }
    
    func remove(at index: Int) {
        chips.remove(at: index)
    }
}


let chipColors: [Color] = [.blue, .yellow, .green, .red, .pink, .purple]
let ChipsMockData = [
    SampleChipModel(type: .circleColor, text: "Hi there", color: .blue),
    SampleChipModel(type: .circleColor, text: "Chip-chip", color: .yellow),
    SampleChipModel(type: .circleColor, text: "Hey", color: .red),
]
