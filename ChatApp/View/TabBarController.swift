//
//  TabBarController.swift
//  ChatApp
//
//  Created by SeoYeon Hong on 2023/05/06.
//

import UIKit

final class TabBarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTabBar()
    }
    
    private func setupTabBar() {
        let tabOne = setupNavigationController(controller: ViewController(), title: "홈", image: Constants.Image.home)
        let tabTwo = setupNavigationController(controller: ViewController(), title: "사람", image: Constants.Image.people)
        let tabThree = setupNavigationController(controller: MessageViewController(), title: Constants.Text.message, image: Constants.Image.message)
        let tabFour = setupNavigationController(controller: ViewController(), title: "마이페이지", image: Constants.Image.account)
        let tabFive = setupNavigationController(controller: ViewController(), title: "채용", image: Constants.Image.suitcase)
        
        UITabBar.appearance().tintColor = Constants.Color.main
        UITabBar.appearance().unselectedItemTintColor = Constants.Color.gray400
        UITabBar.appearance().backgroundColor = .systemBackground
        let line = UIView(frame: CGRect(x: 0, y: -1, width: view.frame.width, height: 1))
        line.backgroundColor = Constants.Color.gray200
        UITabBar.appearance().insertSubview(line, at: 1)
        
        self.viewControllers = [tabOne, tabTwo, tabThree, tabFour, tabFive]
        self.selectedIndex = 2
    }
    
    private func setupNavigationController(controller: UIViewController, title: String, image: String) -> UINavigationController {
        let navigation = UINavigationController(rootViewController: controller)
        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .medium)]
        navigation.navigationBar.titleTextAttributes = attributes as [NSAttributedString.Key : Any]
        navigation.navigationBar.prefersLargeTitles = false
        navigation.tabBarItem.title = title
        navigation.tabBarItem.image = UIImage(named: image)
        
        return navigation
    }
}
