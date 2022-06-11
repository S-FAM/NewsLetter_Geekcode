//
//  SearchViewController.swift
//  NewsTon
//
//  Created by hyeonseok on 2022/06/11.
//

import UIKit

class SearchViewController: UIViewController {

    lazy var testButton: UIButton = {
        let button = UIButton()
        let width: CGFloat = 200
        let height: CGFloat = 200
        let posX: CGFloat = self.view.bounds.width/2 - width/2
        let posY: CGFloat = self.view.bounds.height/2 - height/2
        let originColor: UIColor = .purple
        
        button.tag = 1
        button.frame = CGRect(x: posX, y: posY, width: width, height: height)
        button.backgroundColor = originColor
        button.setTitle("Search Button", for: .normal)
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

   //ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(testButton)

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
