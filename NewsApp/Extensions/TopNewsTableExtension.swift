//
//  TopNewsTableExtension.swift
//  NewsApp
//
//  Created by Rustem Supayev on 29/01/2020.
//  Copyright © 2020 Rustem Supayev. All rights reserved.
//

import UIKit

extension TopNewsController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = NewsDetails()
        vc.url = self.articles?[indexPath.item].url
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 420
    }
    
//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        let one = 1
//        if self.articles?[indexPath.item].headline = self.articles?[indexPath.item].headline?.count - one {
//            fetchArticles()
//        }
//
//    }
    
    
}



extension TopNewsController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return self.articles?.count ?? 0

    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TopNewsCell = tableView.dequeueReusableCell(withIdentifier: cellOne,for: indexPath) as! TopNewsCell
        cell.headline.text = self.articles?[indexPath.item].headline
        cell.date.text = self.articles?[indexPath.item].date
        cell.imageBox.donwloadImage(from: (self.articles?[indexPath.item].imageUrl!)!)
        cell.articleText.text = self.articles?[indexPath.item].desc
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = .lightText
        cell.selectedBackgroundView = backgroundView
        return cell
    }
    
//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        let lastItem = (self.articles?.count ?? 0) - 1
//        if indexPath.row == lastItem {
//            fetchArticles()
//        }
 //   }
    
    
}
