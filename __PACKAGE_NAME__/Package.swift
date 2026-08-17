// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "__PACKAGE_NAME__",
    platforms: [
        .macOS(.v15),
        .iOS(.v18),
    ],
    products: [
        .library(
            name: "__PACKAGE_NAME__",
            targets: ["__PACKAGE_NAME__"]
        ),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "__PACKAGE_NAME__"
        ),
        .testTarget(
            name: "__PACKAGE_NAME__Tests",
            dependencies: ["__PACKAGE_NAME__"]
        ),
    ],
    swiftLanguageModes: [.v6]
)
