import SwiftUI

extension Text {
    func customTitleText() -> Text {
        self
            .fontWeight(.black)
            .font(.system(size: 36))
    }
}

struct ButtonModifier: ViewModifier {
    let color: Color
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .font(.system(size: 16))
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
            .background(RoundedRectangle(cornerRadius: 12, style: .continuous)
                .fill(color))
    }
}

extension View {
    func customButton(color: Color) -> ModifiedContent<Self, ButtonModifier> {
        return modifier(ButtonModifier(color: color))
    }
}
