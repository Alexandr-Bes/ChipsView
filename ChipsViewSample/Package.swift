// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ChipsViewSample",
    platforms: [.iOS(.v16)], // Minimum deployment target is iOS 16
    dependencies: [
        .package(url: "https://github.com/Alexandr-Bes/ChipsView", from: "1.0.0")
    ],
    targets: [
        .target(
           name: "ChipsViewSample",
           dependencies: [
               .product(name: "ChipsView", package: "ChipsView"),
           ]),
    ]
)
