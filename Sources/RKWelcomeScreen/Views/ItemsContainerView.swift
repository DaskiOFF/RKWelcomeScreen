
import SwiftUI

struct ItemsContainerView: View {
    let model: RKWelcomeScreenViewController.Model
    
    var body: some View {
        VStack(alignment: .leading, spacing: 26) {
            ForEach(model.items, id: \.title) { item in
                ItemView(
                    title: item.title,
                    subTitle: item.text,
                    image: item.icon,
                    iconColor: Color(model.appearance.tintColor),
                    titleColor: Color(model.appearance.itemTitleColor),
                    textColor: Color(model.appearance.itemTextColor)
                )
            }
        }
    }
}

// MARK: - Preview

struct ItemsContainerView_Preview: PreviewProvider {
    static var previews: some View {
        ItemsContainerView(model: WelcomeView_preview.model)
            .previewLayout(.sizeThatFits)
    }
}
