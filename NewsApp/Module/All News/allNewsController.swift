//
//  allNewsController.swift
//  NewsApp
//
//  Created by Rustem Supayev on 29/01/2020.
//  Copyright © 2020 Rustem Supayev. All rights reserved.
//

import UIKit

class AllNewsController: UIViewController {
    
    let cellTwo = "secondCellId"
    var articles: [Article]? = []
    let activityIndicator = ActivityIndicator(frame: .zero)
    
    var refresher: UIRefreshControl = {
        let rf = UIRefreshControl()
        rf.addTarget(self, action: #selector(fetchArticles), for: UIControl.Event.valueChanged)
        return rf
    }()
    
    private lazy var newsTableView: UITableView = {
        let tv = UITableView()
        tv.delegate = self
        tv.dataSource = self
        tv.separatorStyle = .none
        tv.register(AllNewsCell.self, forCellReuseIdentifier: cellTwo)
        tv.showsVerticalScrollIndicator = false
        return tv
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.startAnimating()
        fetchArticles()
        setupViews()
    }
    
    func setupViews() {
        navigationItem.title = "All News"
        navigationController?.hidesBarsOnSwipe = true
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .white
        
        [newsTableView, activityIndicator].forEach { view.addSubview ($0) }
        newsTableView.addSubview(refresher)
        
        activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        newsTableView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
    }
    
    @objc func fetchArticles() {
        let urlRequest = URLRequest(url: URL(string: "https://newsapi.org/v2/everything?q=trump&sources=cnn,axios,bbc-news,fox-news,the-hill,google-news-ca,google-news-uk&apiKey=e65ee0938a2a43ebb15923b48faed18d")!) //change if app crashes
        let task = URLSession.shared.dataTask(with: urlRequest) { (data,response,error) in
            
            if error != nil {
                print(error)
                return
            }
            
            self.articles = [Article]()
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String: AnyObject]
                
                if let articlesFromJson = json["articles"] as? [[String: AnyObject]] {
                    for articlesFromJson in articlesFromJson {
                        let article = Article()
                        if
                            let title = articlesFromJson["title"] as? String,
                            let publishedAt = articlesFromJson["publishedAt"] as? String,
                            let urlToImage = articlesFromJson["urlToImage"] as? String,
                            let description = articlesFromJson["description"] as? String,
                            let url = articlesFromJson["url"] as? String
                            
                        {
                            
                            article.headline = title
                            article.date = publishedAt
                            article.imageUrl = urlToImage
                            article.desc = description
                            article.url = url
                            
                            
                        }
                        self.articles?.append(article)
                    }
                    
                }
                DispatchQueue.main.async {
                    self.newsTableView.reloadData()
                    self.activityIndicator.stopAnimating()
                    
                }
                
            } catch let error {
                print(error)
            }
            
        }
        task.resume()
        refresher.endRefreshing()
        
    }
    
}
