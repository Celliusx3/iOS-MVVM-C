//
//  ArticlesViewController.swift
//  HackerNews
//
//  Created by Oh Coyan on 01/03/2020.
//  Copyright © 2020 Oh Coyan. All rights reserved.
//

import UIKit
import WebKit

class ArticlesViewController: UIViewController, Storyboarded {
    @IBOutlet weak var webView: WKWebView!
    static var storyboard: AppStoryboard = AppStoryboard.articles
    
    var url: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let url = url else { return }
        webView.load(URLRequest(url: URL(string: url)!))
        webView.allowsBackForwardNavigationGestures = true
    }
    
}
