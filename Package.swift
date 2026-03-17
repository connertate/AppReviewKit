// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "AppReviewPrompt",
    platforms: [.iOS(.v17)],
    products: [
        .library(name: "AppReviewPrompt", targets: ["AppReviewPrompt"]),
    ],
    targets: [
        .target(
            name: "AppReviewPrompt",
            path: "Sources/AppReviewPrompt"
        ),
    ]
)
