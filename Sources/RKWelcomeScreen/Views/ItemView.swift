import SwiftUI

struct ItemView: View {
    var title: String = "title"
    var subTitle: String = "subTitle subTitle subTitle subTitle subTitle subTitle subTitle subTitle subTitle subTitle subTitle subTitle subTitle subTitle subTitle subTitle subTitle subTitle subTitle subTitle subTitle subTitle subTitle "
    var image: UIImage = UIImage(systemName: "gear")!
    
    let iconColor: Color
    let titleColor: Color
    let textColor: Color

    var body: some View {
        HStack(spacing: 8) {
            Image(uiImage: image.withRenderingMode(.alwaysTemplate))
                .resizable()
                .frame(width: 46, height: 46)
                .frame(maxHeight: .infinity, alignment: .top)
                .foregroundColor(iconColor)
                .accessibilityHidden(true)

            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.system(size: 15))
                    .foregroundColor(titleColor)
                
                Text(subTitle)
                    .font(.system(size: 12))
                    .lineSpacing(2)
                    .foregroundColor(textColor)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel(Text(title + ".") + Text(subTitle))
    }
}

// MARK: - Preview

struct ItemView_Preview: PreviewProvider {
    static var previews: some View {
        ItemView(iconColor: .green, titleColor: .pink, textColor: .purple)
            .previewLayout(.sizeThatFits)
    }
}
