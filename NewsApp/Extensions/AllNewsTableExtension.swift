//
//  AllNewsTableExtension.swift
//  NewsApp
//
//  Created by Rustem Supayev on 29/01/2020.
//  Copyright © 2020 Rustem Supayev. All rights reserved.
//

import UIKit

extension AllNewsController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articles?.count ?? 0

    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: AllNewsCell = tableView.dequeueReusableCell(withIdentifier: cellTwo,for: indexPath) as! AllNewsCell
        cell.headline.text = self.articles?[indexPath.item].headline
        cell.date.text = self.articles?[indexPath.item].date
        cell.imageBox.donwloadImage(from: (self.articles?[indexPath.item].imageUrl!)!) //change URL request parameters if the app crashes
        cell.articleText.text = self.articles?[indexPath.item].desc
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = .lightText
        cell.selectedBackgroundView = backgroundView
        return cell
    }
    
}


extension AllNewsController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = NewsDetails()
        vc.url = self.articles?[indexPath.item].url
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 420
    }
    
}


