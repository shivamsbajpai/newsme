//
//  NewsManager.swift
//  newsapp
//
//  Created by Shivam on 13/09/20.
//  Copyright © 2020 Shivam. All rights reserved.
//

import Foundation

protocol NewsManagerDelegate {
    func didUpdateNews(news: [Articles]?)
    func didFailWithError(error: Error)
}

struct NewsManager {
    
    var delegate: NewsManagerDelegate?
    
    let newsUrl = "https://newsapi.org/v2/top-headlines?country=in&apiKey=\(ApiKey.api)"
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
                    }
                    
                }
            }
            task.resume()
        }
    }
    func parseJSON(_ newsData: Data) -> [Articles]? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(NewsData.self, from: newsData)
            return decodedData.articles
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
