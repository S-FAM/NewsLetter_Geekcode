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
    //TODO: - 페이지 진입, 이탈
    //TODO: - 셀 생성
    //TODO: - 셀 갱신
    //TODO: - API 구현
    //TODO: - API 결과처리
    //TODO: - 테이블뷰 Delegate
    //TODO: - 네비게이션바 구현
    //TODO: - 서치바 구현
    //TODO: - 스켈레톤
    //TODO: - Equipment Type 분류 home, bookmark
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(testButton)
        setupNavigationBar()

    }
    
    
    func setupNavigationBar() {
        navigationController?.navigationBar.isHidden = false
        
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont(name: "Chalkboard SE", size: 25)!
        ]
        
        navigationItem.title = "home"
        navigationController?.navigationBar.tintColor = UIColor.black
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(backBarButtonTapped(_:)))
        
//        navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
    
    
    @objc func backBarButtonTapped(_ sender: UIBarButtonItem) {
            self.dismiss(animated: true)
        }
}

