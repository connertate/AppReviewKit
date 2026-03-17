// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "AppReviewKit",
    platforms: [.iOS(.v17)],
    products: [
        .library(name: "AppReviewKit", targets: ["AppReviewKit"]),
    ],
    targets: [
        .target(
            name: "AppReviewKit",
            path: "Sources/AppReviewPrompt"
        ),
    ]
)
