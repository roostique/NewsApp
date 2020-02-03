//
//  NewsDetails.swift
//  NewsApp
//
//  Created by Rustem Supayev on 30/01/2020.
//  Copyright © 2020 Rustem Supayev. All rights reserved.
//

import UIKit
import WebKit

class NewsDetails: UIViewController {
    
    var url: String?    
    lazy var webView = WKWebView()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.load(URLRequest(url: URL(string: url!)!))
        setupViews()

    }

    func setupViews() {
        view.backgroundColor = .white
        view.addSubview(webView)

        webView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
    
    
}

