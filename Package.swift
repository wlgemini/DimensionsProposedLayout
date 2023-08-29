// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DimensionsProposedLayout",
    platforms: [
        .iOS(.v16), .macOS(.v13), .tvOS(.v16), .watchOS(.v9)
    ],
    products: [
        .library(name: "DimensionsProposedLayout", targets: ["DimensionsProposedLayout"])
    ],
    targets: [
        .target(name: "DimensionsProposedLayout")
    ]
)
