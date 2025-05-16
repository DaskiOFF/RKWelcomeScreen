// swift-tools-version:5.10
import PackageDescription

let package = Package(
    name: "RKWelcomeScreen",
    platforms: [
        .iOS(.v14),
    ],
    products: [
        .library(
            name: "RKWelcomeScreen",
            targets: ["RKWelcomeScreen"]),
    ],
    targets: [
        .target(
            name: "RKWelcomeScreen",
            dependencies: []),
    ]
)
