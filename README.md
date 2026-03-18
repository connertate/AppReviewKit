# AppReviewKit

A lightweight SwiftUI library for presenting customizable in-app review prompts on iOS 17+.

## Installation

Add the package to your project via Swift Package Manager:

```swift
.package(url: "https://github.com/yourname/AppReviewKit.git", from: "1.0.0")
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

## License

MIT
