//
//  ChipsContainerView.swift
//  
//
//  Created by AlexBezkopylnyi on 01.09.2023.
//  All rights reserved.

import SwiftUI

public struct ChipsContainerView<ChipData: ChipModel & Identifiable>: View {
    @Binding var chipsData: [ChipData]
    let viewWidth: CGFloat
    var action: ((Int)->())?
    
    public init(chipsData: Binding<[ChipData]>, width: CGFloat, action: ((_ index: Int)->())? = nil) {
        self._chipsData = chipsData
        self.viewWidth = width
        self.action = action
    }
    
    public var body: some View {
        var width = CGFloat.zero
        var height = CGFloat.zero
        
        ZStack(alignment: .topLeading, content: {
            ForEach(chipsData.indices, id: \.self) { chipIndex in
                ChipView(circleColor: chipsData[chipIndex].color,
                         text: chipsData[chipIndex].text,
                         type: chipsData[chipIndex].type) {
                    action?(chipIndex)
                }
                .padding(.all, 5)
                .alignmentGuide(.leading) { dimension in
                    if (abs(width - dimension.width) > viewWidth) {
                        width = 0
                        height -= dimension.height
                    }
                    
                    let result = width
                    //FIXME: - Delete Force unwrap
                    if chipsData[chipIndex].id == chipsData.last!.id {
                        width = 0
                    } else {
                        width -= dimension.width
                    }
                    return result
                }
                .alignmentGuide(.top) { dimension in
                    let result = height
                    if chipsData[chipIndex].id == chipsData.last!.id {
                        height = 0
                    }
                    return result
                }
            }
        })
    }
}

struct ChipsContainerView_Previews: PreviewProvider {
    static var previews: some View {
        ChipsContainerView(chipsData: .constant(PreviewChipData), width: 350)
    }
}


fileprivate let PreviewChipData = [
    PreviewChipModel(type: .circleColor, text: "Hi there", color: .blue),
    PreviewChipModel(type: .circleColor, text: "Chip-chip", color: .yellow),
    PreviewChipModel(type: .circleColor, text: "Hey", color: .red),
]

fileprivate struct PreviewChipModel: ChipModel, Identifiable {
    let id = UUID().uuidString
    let type: ChipsViewType
    let text: String
    let color: Color
}
