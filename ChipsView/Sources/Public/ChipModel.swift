//
//  ChipModel.swift
//  
//
//  Created by AlexBezkopylnyi on 31.08.2023.
//

import SwiftUI

public enum ChipsViewType {
    case basic // only text
    case circleColor // color circle and text
    //TODO: - Add other types
//    case image // color circle text and image
    
}

public protocol ChipModel: Identifiable {
    var id: String { get }
    var type: ChipsViewType { get }
    var text: String { get }
    var color: Color { get }
}
