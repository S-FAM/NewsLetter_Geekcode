//
//  MainTabBarController.swift
//  NewsTon
//
//  Created by hyeonseok on 2022/06/11.
//

import Foundation
import UIKit

class MainTabBarController: UITabBarController {
    
    func configureTabBarItem(_ type: TabMenuType) -> UITabBarItem { return type.menuTabItem }

    private lazy var homeVC: UIViewController = {
        let homeViewController = UINavigationController(rootViewController: HomeViewController())
        homeViewController.tabBarItem = configureTabBarItem(.home)
        return homeViewController
    }()
    
    private lazy var searchVC: UIViewController = {
        let searchVC = UINavigationController(rootViewController: SearchViewController())
        searchVC.tabBarItem = configureTabBarItem(.search)
        return searchVC
    }()
    
    private lazy var bookmarkVC: UIViewController = {
        let bookmarkVC = UINavigationController(rootViewController: BookMarkViewController())
        bookmarkVC.tabBarItem = configureTabBarItem(.bookmark)
        return bookmarkVC
    }()
    private lazy var settingVC: UIViewController = {
        let settingVC = UINavigationController(rootViewController: SettingViewController())
        settingVC.tabBarItem = configureTabBarItem(.setting)
        return settingVC
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let viewControllers = [
            homeVC,
            searchVC,
            bookmarkVC,
            settingVC
        ]
        setViewControllers(viewControllers, animated: false)
        tabBar.backgroundColor = .lightGray
        tabBar.isTranslucent = false

    }
    
}

extension MainTabBarController  {
    func tabChange(menu: TabMenuType) {
    

        switch menu {
        case .home:
            self.selectedIndex = 0
            break
        case .search:
            self.selectedIndex = 1
            break
        case .bookmark:
            self.selectedIndex = 2
            break
        case .setting:
            break
        }
        
    }
    
    
}
