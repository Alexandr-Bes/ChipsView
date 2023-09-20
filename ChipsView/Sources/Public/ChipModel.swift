//
//  ChipModel.swift
//  
//
//  Created by AlexBezkopylnyi on 31.08.2023.
//  All rights reserved.

import SwiftUI

public enum ChipsViewType {
    case basic // only text
    case circleColor // color circle and text
    //TODO: - Add other types
//    case image // color circle text and image
    
}

public protocol ChipModel: Hashable {
    var id: String { get }
    var type: ChipsViewType { get }
    var text: String { get }
    var color: Color { get }
}

//TODO: - add parameters
public enum ChipAppearAnimation {
    case zoomIn
    case zoomOut
    case shake
    case opacity
}
