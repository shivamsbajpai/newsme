//
//  WebViewController.swift
//  newsapp
//
//  Created by Shivam on 15/09/20.
//  Copyright © 2020 Shivam. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var web: WKWebView!
    var receivedData = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        web.navigationDelegate = self
        web.scrollView.bounces = true
        let url = URL(string: receivedData)
        let request = URLRequest(url: url!)
        activityIndicator.startAnimating()
        web.load(request)
        activityIndicator.hidesWhenStopped = true
        
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activityIndicator.stopAnimating()
    }
    
}
