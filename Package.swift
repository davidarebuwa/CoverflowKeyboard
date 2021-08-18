// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CoverflowKeyboard",
    platforms: [.iOS(.v11)],
    products: [
        .library(
            name: "CoverflowKeyboard",
            targets: ["CoverflowKeyboard"]),
    ],
    dependencies: [

    ],
    targets: [
        .target(
            name: "CoverflowKeyboard",
            dependencies: [],
            path: "Sources"
        )
    ]
)
