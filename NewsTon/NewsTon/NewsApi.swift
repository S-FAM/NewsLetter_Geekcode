//
//  NewsApi.swift
//  NewsTon
//
//  Created by hyeonseok on 2022/06/20.
//

import Foundation
import UIKit

class NewsApi {
    
    static var shared = NewsApi()
    
    static let jsconDecoder: JSONDecoder = JSONDecoder()

    static func urlTaskDone() {
        let item = dataManager.shared.searchResult?.items[0]
        print(item)
    }
    
    static func requestAPIToNaver(queryValue: String) {
        
        let clientID: String = privateInfo.clientID
        let clientKEY: String = privateInfo.clientKEY
        
        let query: String  = "https://openapi.naver.com/v1/search/news.json?query=\(queryValue)"
        let encodedQuery: String = query.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!
        let queryURL: URL = URL(string: encodedQuery)!
       
        var requestURL = URLRequest(url: queryURL)
        requestURL.addValue(clientID, forHTTPHeaderField: "X-Naver-Client-Id")
        requestURL.addValue(clientKEY, forHTTPHeaderField: "X-Naver-Client-Secret")
        
        let task = URLSession.shared.dataTask(with: requestURL) { data, response, error in
            guard error == nil else { print(error); return }
            guard let data = data else { print(error); return }
            
            do {
                let searchInfo: Welcome = try self.jsconDecoder.decode(Welcome.self, from: data)
                dataManager.shared.searchResult = searchInfo
                self.urlTaskDone()
            } catch {
                print(fatalError())
            }
        }
        task.resume()
    }
}
