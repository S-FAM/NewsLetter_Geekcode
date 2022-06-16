//
//  Enum.swift
//  NewsTon
//
//  Created by hyeonseok on 2022/06/13.
//

import Foundation
import UIKit



/// 탭바 메뉴 타입
/// - Variables:
///     - title: 메뉴 명, 접근 불가
///     - image: 메뉴 이미지, 접근 불가
///     - menuTabItem: 탭메뉴 아이템
enum TabMenuType {
    case home
    case search
    case bookmark
    case setting

    private var title: String {
        switch self {
        case .home: return "HOME"
        case .search: return "검색"
        case .bookmark: return "즐겨찾기"
        case .setting: return "메뉴"
        }
    }
    
    private var image: UIImage? {
        switch self {
        case .home: return UIImage(systemName: "house")
        case .search: return UIImage(systemName: "magnifyingglass")
        case .bookmark: return UIImage(systemName: "star")
        case .setting: return UIImage(systemName: "gear")
        }
    }
    
    var menuTabItem: UITabBarItem {
        return UITabBarItem(title: self.title, image: self.image, selectedImage: self.image)
    }
}
