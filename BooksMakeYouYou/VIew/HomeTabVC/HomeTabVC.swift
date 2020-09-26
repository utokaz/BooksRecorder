//
//  HomeTabVCViewController.swift
//  BooksMakeYouYou
//
//  Created by uto kazuori on 2020/08/14.
//  Copyright © 2020 uto kazuori. All rights reserved.
//

import UIKit

class HomeTabVC: UITabBarController, UITabBarControllerDelegate {
    
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uiConfig()
        delegate = self
    }
    
    private func uiConfig() {
        UITabBar.appearance().tintColor = UIColor(named: "deepGreen")
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if currentIndex == selectedIndex {
            let vc = (viewController as? UINavigationController)?.viewControllers.first
            (vc as? BookListVC)?.scrollToTop()
            (vc as? SearchVC)?.focusSearchBar()
        }
        currentIndex = selectedIndex
    }
}
