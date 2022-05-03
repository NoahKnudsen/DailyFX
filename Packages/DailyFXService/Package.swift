// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "DailyFXService",
    platforms: [.macOS("12.0"), .iOS("13.0")],
    products: [
        .library(name: "DailyFXService", targets: ["DailyFXService"]),
    ],
    dependencies: [ .package(path: "../Foundational") ],
    targets: [
        .target(
            name: "DailyFXService",
            dependencies: ["Foundational"]
        ),
        .testTarget(
            name: "DailyFXServiceTests",
            dependencies: [
                "DailyFXService",
                "Foundational"
            ],
            resources: [
                .copy("Resources/author.json"),
                .copy("Resources/dashboard.json"),
                .copy("Resources/markets.json"),
                .copy("Resources/news-story.json"),
            ]
        ),
    ]
)
