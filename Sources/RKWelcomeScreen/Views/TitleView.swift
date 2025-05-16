
import SwiftUI

struct TitleView: View {
    let title: String
    let color: Color
    
    var body: some View {
        Text(title)
            .customTitleText()
            .multilineTextAlignment(.center)
            .foregroundColor(color)
            .accessibilityAddTraits(.isHeader)
    }

}

// MARK: - Preview

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView(title: "Welcome to\nStopwatches", color: .green)
            .previewLayout(.sizeThatFits)
    }
}
