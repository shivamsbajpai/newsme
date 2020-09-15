//
//  WebViewController.swift
//  newsapp
//
//  Created by Shivam on 15/09/20.
//  Copyright © 2020 Shivam. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    @IBOutlet weak var web: WKWebView!
    var receivedData = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        web.allowsBackForwardNavigationGestures = true
        let refresh = UIRefreshControl()
        refresh.addTarget(self, action: #selector(refreshModule(sender:)), for: UIControl.Event.valueChanged)
        web.scrollView.bounces = true
        web.scrollView.addSubview(refresh)
        let url = URL(string: receivedData)
        let request = URLRequest(url: url!)
        DispatchQueue.main.async {
            self.web.load(request)
        }
        
    }
    
    @objc func refreshModule(sender: UIRefreshControl) {
          web.reload()
          sender.endRefreshing()
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
