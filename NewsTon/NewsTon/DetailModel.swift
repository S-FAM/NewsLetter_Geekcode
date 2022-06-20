//
//  DetailModel.swift
//  NewsTon
//
//  Created by hyeonseok on 2022/06/20.
//

import Foundation

// 네이버 뉴스 API 호출 메소드

class dataManager {
    static let shared : dataManager = dataManager()
    var searchResult : Welcome?
    
    private init() {
        
    }
}

// MARK: - Welcome
struct Welcome: Codable {
    let lastBuildDate: String
    let total, start, display: Int
    let items: [Item]
}

// MARK: - Item
struct Item: Codable {
    let title: String
    let originallink, link: String
    let itemDescription, pubDate: String

    enum CodingKeys: String, CodingKey {
        case title, originallink, link
        case itemDescription = "description"
        case pubDate
    }
}
