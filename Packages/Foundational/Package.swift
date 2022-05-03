// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "Foundational",
    platforms: [.macOS("12.0"), .iOS("13.0")],
    products: [
        .library(name: "Foundational", targets: ["Foundational"]),
    ],
    dependencies: [],
    targets: [
        .target(name: "Foundational", dependencies: []),
        .testTarget(name: "FoundationalTests", dependencies: ["Foundational"]),
    ]
)
