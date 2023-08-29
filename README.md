# Chips View - SwiftUI Open Source Package
Chips View is an open-source Swift Package that provides a customizable and easy-to-use chip (tag) component built using SwiftUI. Chips are a great way to display categorizations, selections, or labels in a compact and visually appealing manner. This package aims to simplify the integration of chips into your SwiftUI projects.

<p align="center">
 <img src="https://github.com/Alexandr-Bes/ChipsView/assets/26059573/3a2baf0b-ff0d-4f2d-b82e-7c9462bd2277.png" width="20%"/>
</p>


## Features

- Create and display chips with customizable styles.
- Support for various chip content types, such as text, images, or a combination of both.
- Easily handle chip selection and interaction.
- Highly customizable appearance to match your app's design.
- Built using SwiftUI for smooth integration with your projects.

## Installation

You can integrate Chips View into your project using Swift Package Manager:

1. In Xcode, go to "File" > "Swift Packages" > "Add Package Dependency..."
2. Paste the package repository URL: `https://github.com/Alexandr-Bes/ChipsView`
3. Follow the prompts to complete the integration process.

## Usage

1. Import the `ChipsView` module in your SwiftUI view:

```swift
import SwiftUI
import ChipsView
```
2. Use the ChipsView in your view's body to display a collection of chips:
   
```swift
struct ContentView: View {
    let chipData: [ChipModel] = [
        ChipModel(id: 1, type: .colorCircle, text: "Chip Test", color: Color.blue),
        ChipModel(type: .basic, text: "Basic Text", color: Color.yellow),
        // Add more chips as needed
    ]
    
    var body: some View {
        ChipsView(chips: chipData) { chip in
            Text(chip.label)
                .padding(8)
                .background(chip.isSelected ? Color.blue : Color.gray)
                .foregroundColor(.white)
                .cornerRadius(16)
        }
    }
}
```

## To-Do List

- [ ] Add support for chip images.
- [ ] Add different types animation when adding new chip to container.
- [ ] Implement chip interaction handling.
- [ ] Write unit tests for different chip configurations.
- [ ] Provide more customization options in the package.
- [ ] Create a comprehensive example project demonstrating advanced usage.
- [ ] Update documentation with more usage examples and FAQs.
- [ ] Address user feedback and bug reports.

We welcome contributions from the community to improve and enhance the Chips View package.

## License

Chips View is available under the MIT license. See the LICENSE file for more information.


We hope that Chips View makes it easier for you to integrate and use chips within your SwiftUI projects. If you have any questions, feature requests, or bug reports, please feel free to open an issue on the [GitHub repository](https://github.com/Alexandr-Bes/ChipsView/issues). We appreciate your feedback!
