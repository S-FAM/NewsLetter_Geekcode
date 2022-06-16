//
//  SearchViewController.swift
//  NewsTon
//
//  Created by hyeonseok on 2022/06/11.
//

import UIKit

class SearchViewController: UIViewController {

    
    
    var searchType: SearchViewType!
    let newsSearchBar = UISearchBar()
//    var newsList: Array = []
//    var searchNewsList: [Array] = []

 

   //ViewDidLoad
    
    let searchListTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UINib(nibName: "SearchTableViewCell", bundle: nil), forCellReuseIdentifier: "searchTableViewCell")
        tableView.rowHeight = 120
        return tableView
    }()
    
    convenience init(_ searchType: SearchViewType) {
        self.init()
//        self.searchType = searchType
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setNewsListLayout()
    }
    
    func setupNavigationBar() {
        navigationController?.navigationBar.isHidden = false
    
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont(name: "Chalkboard SE", size: 25)!
        ]
        
//        if self.searchType == .sports {
        navigationItem.title = "뉴스검색"

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
    
    func setNewsListLayout() {

        self.view.backgroundColor = UIColor.white
        self.view.addSubview(newsSearchBar)
        newsSearchBar.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(self.view.frame.height * 0.01)
            make.width.equalTo(self.view).multipliedBy(0.85)
            make.height.equalTo(self.view).multipliedBy(0.05)
            make.centerX.equalTo(self.view)
        }
        newsSearchBar.delegate = self
        newsSearchBar.placeholder = "검색"
        newsSearchBar.searchBarStyle = .minimal
        
        self.view.addSubview(searchListTableView)
        searchListTableView.snp.makeConstraints { make in
            make.top.equalTo(newsSearchBar.snp.bottom).offset(self.view.frame.height * 0.01)
            make.width.equalTo(self.view)
            make.bottom.equalTo(self.view)
            make.centerX.equalTo(self.view)
        }
        searchListTableView.dataSource = self
        searchListTableView.delegate = self
        searchListTableView.keyboardDismissMode = .onDrag
        
        DispatchQueue.main.async {
            self.searchListTableView.reloadData()
        }
        
        
    }
    
    
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

}

extension SearchViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
//        if self.searchType == .holiday {
//            return self.selectVacationList.count
//        }
        
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchTableViewCell", for: indexPath) as! SearchTableViewCell
        cell.selectionStyle = .none
//        cell.cancelDelegate = self
        
        
        return cell
    }
    
}



extension SearchViewController: UISearchBarDelegate {
    
    // 이름 검색
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
//        self.searchNewsList = self.newsList.filter({$0.category.contains(searchText)})
        self.searchListTableView.reloadData()
        
    }
    
    // 리턴키 처리
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
}
