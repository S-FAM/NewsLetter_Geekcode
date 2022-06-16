//
//  ViewController.swift
//  NewsTon
//
//  Created by hyeonseok on 2022/06/10.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    
    lazy var testButton: UIButton = {
        let button = UIButton()
        let width: CGFloat = 200
        let height: CGFloat = 200
        let posX: CGFloat = self.view.bounds.width/2 - width/2
        let posY: CGFloat = self.view.bounds.height/2 - height/2
        let originColor: UIColor = .black
        
        button.tag = 1
        button.frame = CGRect(x: posX, y: posY, width: width, height: height)
        button.backgroundColor = originColor
        button.setTitle("Home Button", for: .normal)
        button.setTitleColor(.black, for: .highlighted)
        button.addTarget(self, action: #selector(self.testButtonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc func testButtonTapped(sender: UIButton){
        print("Home Tapped!!")
        let tabBar = self.tabBarController?.tabBar
        UIView.animate(withDuration: TimeInterval(0.3)) {
            tabBar?.alpha = tabBar?.alpha == 1 ? 0 : 1
            self.testButton.backgroundColor = tabBar?.alpha == 1 ? .gray : .systemTeal
            
        }
    }
    
    //!!!: - 태그는 우선 하드코딩
    //TODO: - 셀 생성
    //TODO: - 셀 갱신
    //TODO: - API 구현
    //TODO: - API 결과처리
    //TODO: - 스켈레톤
    //TODO: - Equipment Type 분류 home, bookmark
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.view.addSubview(testButton)
        setupNavigationBar()

    }
    
    
    func setupNavigationBar() {
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont(name: "Chalkboard SE", size: 25)!
        ]
        
//        if self.searchType == .sports {
        navigationItem.title = "홈"

//        }
        navigationController?.navigationBar.tintColor = UIColor.white
        
//        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(backBarButtonTapped(_:)))
//
        
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithTransparentBackground()
        navigationBarAppearance.backgroundColor = UIColor.systemTeal
    
        navigationBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        navigationItem.scrollEdgeAppearance = navigationBarAppearance
        navigationItem.standardAppearance = navigationBarAppearance
        navigationItem.compactAppearance = navigationBarAppearance

        navigationController?.setNeedsStatusBarAppearanceUpdate()
    }
    
    @objc func backBarButtonTapped(_ sender: UIBarButtonItem) {
            self.dismiss(animated: true)
        }
}

