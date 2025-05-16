![Current version](https://img.shields.io/badge/Version-1.0-green.svg?style=flat)
[![Swift Version 5.10](https://img.shields.io/badge/Swift-5.10-blue.svg?style=flat)](https://developer.apple.com/swift)
[![Recommend xcode version 16.3](https://img.shields.io/badge/Xcode-16.3-blue.svg?style=flat)](https://developer.apple.com/ios)

# RKWelcomeScreen

Пакет для рендеринга приветственного экрана, как у Apple.

<img src="./assets/welcome_example.png" alt="Welcome screen example screenshot" width="300"/>

# Пример использования

Чтобы создать экран требуется проинициализировать его моделью данных и шириной экрана. 

От ширины зависят отступы, чтобы на маленьких экранах с шириной меньше `375` отступы не были большими.

```swift
let model = RKWelcomeScreenViewController.Model(
    title: "Welcome to\nStopwatches",
    items: [
        .init(
            icon: UIImage(), 
            title: "Создавайте", 
            text: "Создавайте любое…"),
        .init(
            icon: UIImage(), 
            title: "Комментруйте", 
            text: "Вы можете добавлять …"),
        .init(
            icon: UIImage(), 
            title: "Настройте", 
            text: "На экране настроек …"),
    ],
    button: ("Продолжить", { print("Okay") }),
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

let welcomeViewController = RKWelcomeScreenViewController(model: model, width: 375)
present(welcomeViewController, animated: true, completion: nil)
``` 
