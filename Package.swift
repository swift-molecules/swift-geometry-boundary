// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "swift-geometry-boundary",
    platforms: [
        .macOS(.v27),
        .iOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27),
        .visionOS(.v27),
    ],
    products: [
        .library(
            name: "Geometry Boundary",
            targets: ["Geometry Boundary"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/swift-atoms/swift-geometry.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-molecules/swift-geometry-affine-geometry.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-atoms/swift-boundary.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-atoms/swift-affine.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-atoms/swift-tagged.git",
            branch: "main"
        ),
    ],
    targets: [
        .target(
            name: "Geometry Boundary",
            dependencies: [
                .product(name: "Geometry", package: "swift-geometry"),
                .product(
                    name: "Geometry Affine Geometry",
                    package: "swift-geometry-affine-geometry"
                ),
                .product(name: "Boundary", package: "swift-boundary"),
            ]
        ),
        .testTarget(
            name: "Geometry Boundary Tests",
            dependencies: [
                .product(name: "Geometry", package: "swift-geometry"),
                .product(
                    name: "Geometry Affine Geometry",
                    package: "swift-geometry-affine-geometry"
                ),
                .product(name: "Boundary", package: "swift-boundary"),
                .product(name: "Affine", package: "swift-affine"),
                .product(name: "Tagged", package: "swift-tagged"),
            ]
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let ecosystem: [SwiftSetting] = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("Lifetimes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
