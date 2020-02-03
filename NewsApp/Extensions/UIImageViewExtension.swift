//
//  UIImageViewExtension.swift
//  NewsApp
//
//  Created by Rustem Supayev on 30/01/2020.
//  Copyright © 2020 Rustem Supayev. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func donwloadImage(from url: String) {
        let urlRequest = URLRequest(url: URL(string: url)!)
        let task = URLSession.shared.dataTask(with: urlRequest) { (data,response,error) in
            
            if error != nil {
                print(error)
                return
            }
            
            DispatchQueue.main.async {
                self.image = UIImage(data: data!)
                
            }
        }
        task.resume()
    }
    
}
