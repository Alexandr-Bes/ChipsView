//
//  ChipsContainerView.swift
//  ChipsView
//
//  Created by AlexBezkopylnyi on 22.08.2023.
//

import SwiftUI
import ChipsView

struct ChipsContainerView: View {
    @ObservedObject private var viewModel: ChipsViewModel
    private let viewWidth: CGFloat
    
    init(viewModel: ChipsViewModel, width: CGFloat) {
        self.viewModel = viewModel
        self.viewWidth = width
    }
    
    var body: some View {
        var width = CGFloat.zero
        var height = CGFloat.zero
        
        ZStack(alignment: .topLeading, content: {
            ForEach(viewModel.chips.indices, id: \.self) { chipIndex in
                ChipView(circleColor: viewModel.chips[chipIndex].color,
                         text: viewModel.chips[chipIndex].text,
                         type: viewModel.chips[chipIndex].type) {
                    viewModel.remove(at: chipIndex)
                }
                .padding(.all, 5)
                .alignmentGuide(.leading) { dimension in
                    if (abs(width - dimension.width) > viewWidth) {
                        width = 0
                        height -= dimension.height
                    }
                    
                    let result = width
                    //FIXME: - Delete Force unwrap
                    if viewModel.chips[chipIndex].id == viewModel.chips.last!.id {
                        width = 0
                    } else {
                        width -= dimension.width
                    }
                    return result
                }
                .alignmentGuide(.top) { dimension in
                    let result = height
                    if viewModel.chips[chipIndex].id == viewModel.chips.last!.id {
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
        ChipsContainerView(viewModel: ChipsViewModel(), width: 350)
//        GeometryReader { previewProxy in
//            ChipsContainerView(viewModel: ChipsViewModel(), geo: previewProxy)
//        }
    }
}

