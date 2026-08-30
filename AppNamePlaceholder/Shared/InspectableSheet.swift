import SwiftUI

struct InspectableSheet<Sheet: View>: ViewModifier {
    let isPresented: Binding<Bool>
    let onDismiss: (() -> Void)?
    let popupBuilder: () -> Sheet

    func body(content: Content) -> some View {
        content.sheet(isPresented: isPresented, onDismiss: onDismiss, content: popupBuilder)
    }
}

extension View {
    func inspectableSheet(
        isPresented: Binding<Bool>,
        onDismiss: (() -> Void)? = nil,
        @ViewBuilder content: @escaping () -> some View,
    ) -> some View {
        modifier(InspectableSheet(isPresented: isPresented, onDismiss: onDismiss, popupBuilder: content))
    }

    func inspectableSheet<Item: Identifiable>(
        item: Binding<Item?>,
        onDismiss: (() -> Void)? = nil,
        @ViewBuilder content: @escaping (Item) -> some View,
    ) -> some View {
        modifier(InspectableSheetWithItem(item: item, onDismiss: onDismiss, popupBuilder: content))
    }
}

struct InspectableSheetWithItem<Item: Identifiable, Sheet: View>: ViewModifier {
    let item: Binding<Item?>
    let onDismiss: (() -> Void)?
    let popupBuilder: (Item) -> Sheet

    func body(content: Content) -> some View {
        content.sheet(item: item, onDismiss: onDismiss, content: popupBuilder)
    }
}
