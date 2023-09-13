//
//  ContentView.swift
//  ChipsView
//
//  Created by AlexBezkopylnyi on 22.08.2023.
//

import SwiftUI
import ChipsView

struct ContentView: View, KeyboardReadable {
    @State private var newChipText = ""
    @State private var newChipColor: BasicChipColors = .blue
    @State private var isTextFieldFocused: Bool = false
    
    
    @ObservedObject private var viewModel = ChipsViewModel()
    
    var body: some View {
        VStack {
            GeometryReader { geometry in
//                ChipsContainerView2(viewModel: ChipsViewModel(), width: geometry.size.width)
//                    .padding()
                ChipsContainerView(chipsData: $viewModel.chips, width: geometry.size.width) { chipIndex in
                    viewModel.remove(at: chipIndex)
                }
                .padding()
            }
        
            createNewChip()
            
            HStack(spacing: 5) {
                
                TextField("Add new chip", text: $newChipText)
                    .padding()
                    .background(Color.yellow.opacity(isTextFieldFocused ? 1.0 : 0.5))
                    .cornerRadius(14)
                    .onReceive(keyboardPublisher) { newIsKeyboardVisible in
                        isTextFieldFocused = newIsKeyboardVisible
                    }
                    .onSubmit {
                        addNewChip()
                    }
                
                Button {
                    addNewChip()
                } label: {
                    Image(systemName: "arrow.up.circle")
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width: 35, height: 35)
                        .background(
                            Circle()
                            .fill(.blue).opacity(newChipText.isEmpty ? 0.3 : 1.0)
                        )
                }
            }
            .frame(height: 45)
        }
        .padding()
    }
    
    private func addNewChip() {
        let feedbackGenerator = UIImpactFeedbackGenerator(style: .soft)
        feedbackGenerator.impactOccurred()
        withAnimation {
            viewModel.addNew(text: newChipText, color: newChipColor)
            newChipText = ""
        }
    }
    
    @ViewBuilder private func createNewChip() -> some View {
        Menu {
            Picker("Choose color", selection: $newChipColor) {
                ForEach(BasicChipColors.allCases) { color in
                    Text(color.text)
                }
            }
        } label: {
            ChipView(circleColor: newChipColor.value, text: newChipText)
                .padding()
                .frame(maxWidth: 300)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
