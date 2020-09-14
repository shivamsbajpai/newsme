//
//  NewsManager.swift
//  newsapp
//
//  Created by Shivam on 13/09/20.
//  Copyright © 2020 Shivam. All rights reserved.
//
//articles[0].author

import Foundation

protocol NewsManagerDelegate {
    func didUpdateNews(news: [Articles]?)
    func didFailWithError(error: Error)
}

struct NewsManager {
    
    var delegate: NewsManagerDelegate?
    
    let newsUrl = "https://newsapi.org/v2/top-headlines?country=us&apiKey=16d41c4d36c64372b061c1837b00a9ee"
    //16d41c4d36c64372b061c1837b00a9ee
    //6806d489a89c4f70858e889f073a2abc
    
    func fetchNews() {
        performRequest(urlString: newsUrl)
    }
    func performRequest(urlString: String) {
       
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data {
                    if let news = self.parseJSON(safeData){
                        self.delegate?.didUpdateNews(news: news)
//                        print("newsManager \(news.title)")
                    }
                    
                }
            }
            task.resume()
        }
    }
//    articles[0].source.id
    func parseJSON(_ newsData: Data) -> [Articles]? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(NewsData.self, from: newsData)
        
            return decodedData.articles
//            print(decodedData.articles[0].publishedAt)
//            print(decodedData.articles[2].content!)
//            print(decodedData.articles[0].author!)
//            print(decodedData.articles[0].description!)
//            print(decodedData.articles[0].source.id!)
//            print(decodedData.articles[0].url)
//            print(decodedData.articles[0].urlToImage)
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
