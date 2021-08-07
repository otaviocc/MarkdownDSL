// swift-tools-version:5.4

import PackageDescription

let package = Package(
    name: "Markdown",
    products: [
        .library(
            name: "Markdown",
            targets: ["Markdown"]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Markdown",
            dependencies: []
        ),
        .testTarget(
            name: "MarkdownTests",
            dependencies: ["Markdown"]
        )
    ]
)
