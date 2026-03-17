import SwiftUI

public struct StarRatingView: View {
    @Binding public var rating: Int
    public let maxRating: Int

    public init(rating: Binding<Int>, maxRating: Int = 5) {
        self._rating = rating
        self.maxRating = maxRating
    }

    public var body: some View {
        HStack(spacing: 12) {
            ForEach(1...maxRating, id: \.self) { index in
                Image(systemName: index <= rating ? "star.fill" : "star")
                    .font(.title)
                    .foregroundStyle(index <= rating ? .yellow : .gray)
                    .contentTransition(.symbolEffect(.replace))
                    .onTapGesture {
                        withAnimation {
                            rating = index
                        }
                        HapticFeedback.lightImpact()
                    }
            }
        }
    }
}
