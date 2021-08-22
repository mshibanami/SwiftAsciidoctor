// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftAsciidoctor",
    platforms: [
        .macOS(.v10_10),
        .iOS(.v10)
    ],
    products: [
        .library(
            name: "SwiftAsciidoctor",
            targets: ["SwiftAsciidoctor"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "SwiftAsciidoctor",
            dependencies: [],
            resources: [
                .process("asciidoctor.min.js")
            ]),
        .testTarget(
            name: "SwiftAsciidoctorTests",
            dependencies: ["SwiftAsciidoctor"]),
    ]
)
