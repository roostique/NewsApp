//
//  ActivityIndicator.swift
//  NewsApp
//
//  Created by Rustem Supayev on 31/01/2020.
//  Copyright © 2020 Rustem Supayev. All rights reserved.
//

import UIKit

class ActivityIndicator: UIActivityIndicatorView {
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.hidesWhenStopped = true
        self.translatesAutoresizingMaskIntoConstraints = false
        self.style = .gray
        
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
