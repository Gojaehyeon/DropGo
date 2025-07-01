import SwiftUI

struct InputPanelView: View {
    @State private var text: String = ""
    @FocusState private var isFocused: Bool
    var onCommit: ((String) -> Void)? = nil
    
    var body: some View {
        VStack {
            TextField("짧은 생각을 입력하세요...", text: $text, onCommit: {
                if !text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                    onCommit?(text)
                    text = ""
                }
            })
            .textFieldStyle(PlainTextFieldStyle())
            .font(.system(size: 22, weight: .medium, design: .rounded))
            .padding(.horizontal, 28)
            .padding(.vertical, 18)
            .background(.ultraThinMaterial)
            .cornerRadius(18)
            .shadow(radius: 16)
            .focused($isFocused)
            .onAppear { isFocused = true }
        }
        .padding(32)
        .frame(width: 420)
        .background(
            RoundedRectangle(cornerRadius: 24, style: .continuous)
                .fill(.ultraThinMaterial)
                .shadow(radius: 24)
        )
    }
}

#Preview {
    InputPanelView()
} 