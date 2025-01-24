// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Replacements",
    platforms: [
        .macOS(.v13),
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Replacements",
            targets: ["Replacements"]),
    ],
    dependencies: [
        .package(url: "https://github.com/stefanspringer1/FastReplace", from: "1.0.7"),
        .package(url: "https://github.com/stefanspringer1/RegexTemplates.git", from: "2.0.2"),
        .package(url: "https://github.com/stefanspringer1/RegexTemplatesWithEntities.git", from: "3.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Replacements",
            dependencies: [
                "FastReplace",
            ]
        ),
        .testTarget(
            name: "ReplacementsTests",
            dependencies: [
                "Replacements",
                "RegexTemplates",
                "RegexTemplatesWithEntities",
            ]
        ),
    ]
)
