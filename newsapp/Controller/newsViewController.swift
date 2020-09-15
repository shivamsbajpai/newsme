//
//  newsViewController.swift
//  newsapp
//
//  Created by Shivam on 13/09/20.
//  Copyright © 2020 Shivam. All rights reserved.
//

import UIKit //check
import WebKit

class newsViewController: UITableViewController, NewsManagerDelegate {
    
    var newsManager = NewsManager()
    var articles: [Articles]?
    
    var url: String?
    var image: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newsManager.delegate = self
        newsManager.fetchNews()
        tableView.register(UINib(nibName: "newsCell", bundle: nil), forCellReuseIdentifier: "reusableCell")
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reusableCell", for: indexPath) as! newsCell
        cell.label.numberOfLines = 0
        cell.label.text = articles?[indexPath.row].title
        
        if let urlString = (articles?[indexPath.row].urlToImage) {
            let url = URL(string: urlString)!
            cell.newsImage.loadImage(fromURL: url, placeHolderImage: "doc")
        } else {
            cell.newsImage.image = UIImage(systemName: "doc")
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        url = articles?[indexPath.row].url!
        self.performSegue(withIdentifier: "webView", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func didUpdateNews(news: [Articles]?) {
        DispatchQueue.main.async {
            self.articles = news
            self.tableView.reloadData()
        }
        
    }
    func didFailWithError(error: Error) {
        print(error)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let webViewController = segue.destination as! WebViewController
        webViewController.receivedData = url!
    }
}


