import SwiftUI

struct AppReviewPromptModifier: ViewModifier {
    @Binding var isPresented: Bool
    let title: LocalizedStringKey
    let subtitle: LocalizedStringKey?
    let icon: Image?
    let onRating: (Int) -> Void
    let onDismiss: (() -> Void)?

    func body(content: Content) -> some View {
        content
            .overlay {
                if isPresented {
                    ZStack {
                        Color.black.opacity(0.4)
                            .ignoresSafeArea()

                        AppReviewPromptView(
                            title: title,
                            subtitle: subtitle,
                            icon: icon,
                            onRating: onRating,
                            onDismiss: onDismiss
                        )
                        .transition(.scale(scale: 0.9).combined(with: .opacity))
                    }
                    .animation(.easeOut(duration: 0.2), value: isPresented)
                }
            }
    }
}

extension View {
    public func appReviewPrompt(
        isPresented: Binding<Bool>,
        title: LocalizedStringKey,
        subtitle: LocalizedStringKey? = nil,
        icon: Image? = nil,
        onRating: @escaping (Int) -> Void,
        onDismiss: (() -> Void)? = nil
    ) -> some View {
        modifier(AppReviewPromptModifier(
            isPresented: isPresented,
            title: title,
            subtitle: subtitle,
            icon: icon,
            onRating: onRating,
            onDismiss: onDismiss
        ))
    }
}
