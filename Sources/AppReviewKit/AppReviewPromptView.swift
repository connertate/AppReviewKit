import SwiftUI

public struct AppReviewPromptView: View {
    private let title: LocalizedStringKey
    private let subtitle: LocalizedStringKey?
    private let primaryButtonTitle: LocalizedStringKey
    private let dismissButtonTitle: LocalizedStringKey
    private let onRating: (Int) -> Void
    private let onDismiss: (() -> Void)?

    @State private var rating = 0

    public init(
        title: LocalizedStringKey,
        subtitle: LocalizedStringKey? = nil,
        primaryButtonTitle: LocalizedStringKey = "Submit",
        dismissButtonTitle: LocalizedStringKey = "Not Now",
        onRating: @escaping (Int) -> Void,
        onDismiss: (() -> Void)? = nil
    ) {
        self.title = title
        self.subtitle = subtitle
        self.primaryButtonTitle = primaryButtonTitle
        self.dismissButtonTitle = dismissButtonTitle
        self.onRating = onRating
        self.onDismiss = onDismiss
    }

    public var body: some View {
        VStack(spacing: 20) {
            Text(title)
                .font(.title2.bold())

            if let subtitle {
                Text(subtitle)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
            }

            StarRatingView(rating: $rating)
                .padding(.vertical, 8)

            Button {
                HapticFeedback.success()
                onRating(rating)
            } label: {
                Text(primaryButtonTitle)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .disabled(rating == 0)

            Button {
                onDismiss?()
            } label: {
                Text(dismissButtonTitle)
                    .font(.subheadline)
            }
            .buttonStyle(.plain)
            .foregroundStyle(.secondary)
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 16)
        .presentationDetents([.height(300)])
        .presentationDragIndicator(.visible)
    }
}
