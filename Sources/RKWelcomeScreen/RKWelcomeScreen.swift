import UIKit
import SwiftUI

public final class RKWelcomeScreenViewController: UIViewController {
    private let model: Model
    private let child: UIHostingController<WelcomeView>
    
    public init(model: Model, width: CGFloat) {
        self.model = model
        
        child = UIHostingController(rootView: WelcomeView(model: model, isSmallDevice: width < 375))
        
        super.init(nibName: nil, bundle: nil)
    }
    
    public required init?(coder: NSCoder) { fatalError() }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        addChild(child)
        view.addSubview(child.view)
        child.view.frame = view.bounds
        child.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        child.didMove(toParent: self)
    }
}

// MARK: - Model

extension RKWelcomeScreenViewController {
    public struct Model {
        public let title: String
        public let items: [Item]
        public let button: (title: String, action: () -> Void)
        
        public let appearance: Appearance
        
        public init(title: String, items: [RKWelcomeScreenViewController.Item], button: (title: String, action: () -> Void), appearance: RKWelcomeScreenViewController.Appearance) {
            self.title = title
            self.items = items
            self.button = button
            self.appearance = appearance
        }
    }
    
    public struct Item {
        let icon: UIImage
        let title: String
        let text: String
        
        public init(icon: UIImage, title: String, text: String) {
            self.icon = icon
            self.title = title
            self.text = text
        }
    }
    
    public struct Appearance {
        let titleColor: UIColor
        let itemTitleColor: UIColor
        let itemTextColor: UIColor
        
        let backgrounColor: UIColor
        let tintColor: UIColor
        
        let buttonColor: UIColor
        let buttonTextColor: UIColor
        
        public init(titleColor: UIColor, itemTitleColor: UIColor, itemTextColor: UIColor, backgrounColor: UIColor, tintColor: UIColor, buttonColor: UIColor, buttonTextColor: UIColor) {
            self.titleColor = titleColor
            self.itemTitleColor = itemTitleColor
            self.itemTextColor = itemTextColor
            self.backgrounColor = backgrounColor
            self.tintColor = tintColor
            self.buttonColor = buttonColor
            self.buttonTextColor = buttonTextColor
        }
    }
}
