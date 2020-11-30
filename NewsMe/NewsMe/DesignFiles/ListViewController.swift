//
//  ListViewController.swift
//  NewsMe
//
//  Created by Shivam on 30/11/20.
//

import UIKit

class ListViewController: UITableViewController,NewsManagerDelegate {
    
    var newsManager = NewsManager()
    var articles: [Articles]?
    
    var url: String?
    var image: UIImage?
        
    override func viewDidLoad() {
        super.viewDidLoad()

        newsManager.delegate = self
        newsManager.fetchNews()
        tableView.register(UINib(nibName: "NewsViewCell", bundle: nil), forCellReuseIdentifier: "NewsViewCell")
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: UIBarButtonItem.Style.plain, target: self, action: #selector(back))
        //self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector(done))
        self.title = "News Me"
        self.navigationController?.isNavigationBarHidden = false
    }
    @objc func back() {
        navigationController?.popViewController(animated: true)
        self.navigationController?.isNavigationBarHidden = true
    }

    @objc func done() {
        //save things
        self.dismiss(animated: true, completion: nil)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsViewCell", for: indexPath) as! NewsViewCell
        
        cell.newsHeadline.numberOfLines = 0
        cell.newsHeadline.text = articles?[indexPath.row].title
        
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
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        
//        let webViewController = segue.destination as! WebViewController
//        webViewController.receivedData = url!
//    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
}
