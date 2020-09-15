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
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        tableView.register(UINib(nibName: "newsCell", bundle: nil), forCellReuseIdentifier: "reusableCell")
    }
    
    // MARK: - Table view data source
    
    //    override func numberOfSections(in tableView: UITableView) -> Int {
    //        // #warning Incomplete implementation, return the number of sections
    //        return 0
    //    }
    
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return articles?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reusableCell", for: indexPath) as! newsCell
        
        cell.label.numberOfLines = 0
        cell.label.text = articles?[indexPath.row].title
       // let urlString = articles?[indexPath.row].urlToImage
        
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            

    
        url = articles?[indexPath.row].url!
        //print((articles?[indexPath.row].url)!)
            self.performSegue(withIdentifier: "webView", sender: self)
        
            tableView.deselectRow(at: indexPath, animated: true)
            
        }
    
    func didUpdateNews(news: [Articles]?) {
         DispatchQueue.main.async {
            
//             self.txt = news.title
            self.articles = news
            self.tableView.reloadData()
         }
         
     }
     func didFailWithError(error: Error) {
         print(error)
     }
    
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // get a reference to the second view controller
        let webViewController = segue.destination as! WebViewController
        
        // set a variable in the second view controller with the data to pass
        webViewController.receivedData = url!
    }
    
    
    

}


