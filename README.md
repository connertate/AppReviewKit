# AppReviewKit

[![Swift 5.9](https://img.shields.io/badge/Swift-5.9-orange.svg)](https://img.shields.io/badge/Swift-5.9-orange.svg)
[![iOS 17+](https://img.shields.io/badge/iOS-17%2B-blue.svg)](https://img.shields.io/badge/iOS-17%2B-blue.svg)
[![SPM](https://img.shields.io/badge/SPM-compatible-brightgreen.svg)](https://img.shields.io/badge/SPM-compatible-brightgreen.svg)
[![License](https://img.shields.io/badge/License-MIT-lightgrey.svg)](https://img.shields.io/badge/License-MIT-lightgrey.svg)

A lightweight SwiftUI library for presenting customizable in-app review prompts with star ratings.

## Installation

```
https://github.com/yourname/AppReviewKit.git
```

## Usage

```swift
import AppReviewKit

struct ContentView: View {
    @State private var showReview = false

    var body: some View {
        Button("Leave a Review") { showReview = true }
            .appReviewPrompt(
                isPresented: $showReview,
                title: "Enjoying the app?",
                subtitle: "Tap a star to rate your experience."
            ) { rating in
                print("Rated \(rating) stars")
            }
    }
}
```

## Requirements

- iOS 17+
- Swift 5.9+
- Xcode 15+

## License

MIT License. See LICENSE for details.
