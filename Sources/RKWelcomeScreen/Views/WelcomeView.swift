import SwiftUI

struct WelcomeView: View {
    private let model: RKWelcomeScreenViewController.Model
    
    private let topInset: CGFloat
    private let horizontalInsets: CGFloat
    
    init(model: RKWelcomeScreenViewController.Model, isSmallDevice: Bool) {
        self.model = model
        
        topInset = isSmallDevice ? 0 : 38
        horizontalInsets = isSmallDevice ? 12 : 24
    }
    
    var body: some View {
        VStack {
            ScrollView {
                Group {
                    Spacer().frame(height: topInset)
                    TitleView(title: model.title, color: Color(model.appearance.titleColor))
                    Spacer().frame(height: 56)

                    ItemsContainerView(model: model)
                }.padding(horizontalInsets)
            }
            
            Button(action: {
                model.button.action()
            }) {
                Text(model.button.title)
                    .customButton(color: Color(model.appearance.buttonColor))
                    .foregroundColor(Color(model.appearance.buttonTextColor))
            }
            .padding(horizontalInsets)
        }
        .background(Color(model.appearance.backgrounColor))
    }
}

// MARK: - Preview

struct WelcomeView_preview: PreviewProvider {
    static let model = RKWelcomeScreenViewController.Model(
        title: "Welcome to\nStopwatches",
        items: [
            .init(icon: UIImage(systemName: "gear")!, title: "Создавайте", text: "Создавайте любое количество секундомеров без каких-либо ограничений. Выбирайте любой цвет для вашего секундомера."),
            .init(icon: UIImage(systemName: "gear")!, title: "Комментруйте", text: "Вы можете добавлять комментарии к вашим кругам, пишите на чтобы было потрачено время или любую другую информацию, к которой вы хотите вернуться."),
            .init(icon: UIImage(systemName: "gear")!, title: "Настройте", text: "На экране настроек вы можете включить компактный режим, добавление новых секундомеров сверху списка, а так же превью комментариев."),
        ],
        button: ("Continue", { print("Okay") }),
        appearance: .init(
            titleColor: .label,
            itemTitleColor: .label,
            itemTextColor: .secondaryLabel,
            backgrounColor: .systemBackground,
            tintColor: .systemBlue,
            buttonColor: .systemBlue,
            buttonTextColor: .white
        )
    )
    
    static var previews: some View {
        Group {
            WelcomeView(model: model, isSmallDevice: true)
                .previewDevice("iPhone SE (1st generation)")
            
            WelcomeView(model: model, isSmallDevice: false)
                .previewDevice("iPhone 13 Pro")
        }
    }
}
