// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "AppNamePlaceholderCore",
    platforms: [
        .macOS(.v15),
        .iOS(.v18),
    ],
    products: [
        .library(
            name: "AppNamePlaceholderCore",
            targets: ["AppNamePlaceholderCore"]
        ),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "AppNamePlaceholderCore"
        ),
        .testTarget(
            name: "AppNamePlaceholderCoreTests",
            dependencies: ["AppNamePlaceholderCore"]
        ),
    ],
    swiftLanguageModes: [.v6]
)
