import SwiftUI

public struct AppReviewPromptView: View {
    private let title: LocalizedStringKey
    private let subtitle: LocalizedStringKey?
    private let dismissButtonTitle: LocalizedStringKey
    private let icon: Image?
    private let onRating: (Int) -> Void
    private let onDismiss: (() -> Void)?

    @State private var rating = 0

    public init(
        title: LocalizedStringKey,
        subtitle: LocalizedStringKey? = nil,
        dismissButtonTitle: LocalizedStringKey = "Not Now",
        icon: Image? = nil,
        onRating: @escaping (Int) -> Void,
        onDismiss: (() -> Void)? = nil
    ) {
        self.title = title
        self.subtitle = subtitle
        self.dismissButtonTitle = dismissButtonTitle
        self.icon = icon
        self.onRating = onRating
        self.onDismiss = onDismiss
    }

    public var body: some View {
        VStack(spacing: 0) {
            VStack(spacing: 8) {
                if let icon {
                    icon
                        .resizable()
                        .scaledToFit()
                        .frame(width: 44, height: 44)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding(.bottom, 4)
                }

                Text(title)
                    .font(.headline)

                if let subtitle {
                    Text(subtitle)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                        .multilineTextAlignment(.center)
                }
            }
            .padding(.horizontal, 20)
            .padding(.top, 20)
            .padding(.bottom, 16)

            Divider()

            StarRatingView(rating: $rating)
                .padding(.vertical, 16)
                .onChange(of: rating) { _, newValue in
                    HapticFeedback.success()
                    onRating(newValue)
                }

            Divider()

            Button {
                onDismiss?()
            } label: {
                Text(dismissButtonTitle)
                    .font(.body)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 12)
            }
            .buttonStyle(.plain)
        }
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 14))
        .shadow(color: .black.opacity(0.2), radius: 40, y: 10)
        .padding(.horizontal, 52)
    }
}
