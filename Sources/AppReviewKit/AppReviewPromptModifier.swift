import SwiftUI

struct AppReviewPromptModifier: ViewModifier {
    @Binding var isPresented: Bool
    let title: LocalizedStringKey
    let subtitle: LocalizedStringKey?
    let onRating: (Int) -> Void
    let onDismiss: (() -> Void)?

    func body(content: Content) -> some View {
        content
            .sheet(isPresented: $isPresented) {
                AppReviewPromptView(
                    title: title,
                    subtitle: subtitle,
                    onRating: onRating,
                    onDismiss: onDismiss
                )
            }
    }
}

extension View {
    public func appReviewPrompt(
        isPresented: Binding<Bool>,
        title: LocalizedStringKey,
        subtitle: LocalizedStringKey? = nil,
        onRating: @escaping (Int) -> Void,
        onDismiss: (() -> Void)? = nil
    ) -> some View {
        modifier(AppReviewPromptModifier(
            isPresented: isPresented,
            title: title,
            subtitle: subtitle,
            onRating: onRating,
            onDismiss: onDismiss
        ))
    }
}
