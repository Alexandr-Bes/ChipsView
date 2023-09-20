// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ChipsView",
    platforms: [.iOS(.v16)], // Minimum deployment target is iOS 16
    products: [
        .library(
            name: "ChipsView",
            targets: ["ChipsView"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "ChipsView",
            dependencies: [],
            path: "Sources"),
//            path: "Sources"),
        .testTarget(
            name: "ChipsViewTests",
            dependencies: ["ChipsView"]),
    ],
    .version("1.0.0")
)
