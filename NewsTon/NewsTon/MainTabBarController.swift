//
//  MainTabBarController.swift
//  NewsTon
//
//  Created by hyeonseok on 2022/06/11.
//

import Foundation
import UIKit

class MainTabBarController: UITabBarController {
    
    let homeVC = HomeViewController()
    let searchVC = SearchViewController()
    let bookmarkVC = BookMarkViewController()
    let settingVC = SettingViewController()

    
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let viewControllers = [
            homeVC,
            searchVC,
            bookmarkVC,
            settingVC
        ]
        setViewControllers(viewControllers, animated: false)
        
        homeVC.tabBarItem.image = UIImage(systemName: "newspaper")
        searchVC.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        bookmarkVC.tabBarItem.image = UIImage(systemName: "star")
        settingVC.tabBarItem.image = UIImage(systemName: "gear")
        
        homeVC.title = "뉴스"
        searchVC.title = "검색"
        bookmarkVC.title = "북마크"
        settingVC.title = "설정"
        
        
        tabBar.backgroundColor = .lightGray
        tabBar.isTranslucent = false

    }
    
}
