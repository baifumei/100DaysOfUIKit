//
//  DetailViewController.swift
//  Project16
//
//  Created by Екатерина К on 2/8/24.
//

import UIKit
import WebKit


class DetailViewController: UIViewController {
    var webView: WKWebView!
    var city: String!
    
    let wikiURL = "https://en.wikipedia.org/wiki/"
    
    override func loadView() {
        webView = WKWebView()
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        city = city.replacingOccurrences(of: " ", with: "_")
        let url = URL(string: wikiURL + city)
        webView.load(URLRequest(url: url!))
        title = city
    }
}
