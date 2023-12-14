//
//  ViewController.swift
//  Project4
//
//  Created by Екатерина К on 07.12.2023.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    var webView: WKWebView!
    var progressView: UIProgressView!
    var websites: [String]!
    var initialWebsite: String!
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        openPage(action: UIAlertAction(title: initialWebsite, style: .default))
        title = webView.title
        navigationItem.largeTitleDisplayMode = .never
        webView.allowsBackForwardNavigationGestures = true
        webView.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context: nil)
        
//        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Open", style: .plain, target: self, action: #selector(openTapped))

        progressView = UIProgressView(progressViewStyle: .default)
        progressView.sizeToFit()
        let progressButton = UIBarButtonItem(customView: progressView)
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let refresh = UIBarButtonItem(barButtonSystemItem: .refresh, target: webView, action: #selector(webView.reload))
        let buttonGoBack = UIBarButtonItem(image:  UIImage(systemName: "chevron.backward"), style: .plain, target: webView, action: #selector(webView.goBack))
        let buttonGoForward = UIBarButtonItem(image:  UIImage(systemName: "chevron.forward"), style: .plain, target: webView, action: #selector(webView.goForward))
        
        toolbarItems = [buttonGoBack, buttonGoForward, spacer, progressButton, spacer, refresh]
        navigationController?.isToolbarHidden = false
        
//        let url = URL(string: "https://" + initialWebsite)!
//        webView.load(URLRequest(url: url))
    }
    
//    @objc func openTapped() {
//           let ac = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
//           for website in websites {
//               ac.addAction(UIAlertAction(title: website, style: .default, handler: openPage))
//           }
//           ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
//           ac.popoverPresentationController?.barButtonItem = self.navigationItem.rightBarButtonItem
//           present(ac, animated: true)
//       }
    
    func openPage(action: UIAlertAction) {
            let url = URL(string: "https://\(action.title!)")!
            webView.load(URLRequest(url: url))
        }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = webView.title
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
            if keyPath == "estimatedProgress" {
                progressView.progress = Float(webView.estimatedProgress)
            }
        }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        let url = navigationAction.request.url
        
        if let host = url?.host {
            for website in websites {
                if host.contains(website) {
                    decisionHandler(.allow)
                    return
                }
            }
            let notAllowedAlert = UIAlertController(title: "The URL Link is blocked", message: "The link is broken or it's not supported by the app", preferredStyle: .alert)
            notAllowedAlert.addAction(UIAlertAction(title: "cancel", style: .cancel))
            present(notAllowedAlert, animated: true)
        }
        decisionHandler(.cancel)
    }
}

