// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "DailyFXService",
    platforms: [.macOS("12.0"), .iOS("13.0")],
    products: [
        .library(name: "DailyFXService", targets: ["DailyFXService"]),
    ],
    dependencies: [],
    targets: [
        .target(name: "DailyFXService", dependencies: []),
        .testTarget(name: "DailyFXServiceTests", dependencies: ["DailyFXService"]),
    ]
)
