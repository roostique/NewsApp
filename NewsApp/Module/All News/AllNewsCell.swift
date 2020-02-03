//
//  AllNewsCell.swift
//  NewsApp
//
//  Created by Rustem Supayev on 29/01/2020.
//  Copyright © 2020 Rustem Supayev. All rights reserved.
//

import UIKit

class AllNewsCell: UITableViewCell {
    
    private lazy var container: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var headline: UILabel = {
        let lbl = UILabel()
        lbl.text = "Test"
        lbl.textColor = .black
        lbl.numberOfLines = 0
        lbl.clipsToBounds = true
        lbl.font = UIFont(name:"TimesNewRomanPS-BoldMT", size: 24.0)
        return lbl
    }()
    
    lazy var date: UILabel = {
        let lbl = UILabel()
        lbl.text = "Published Date"
        lbl.textColor = .gray
        lbl.font = UIFont(name:"TimesNewRomanPS-BoldMT", size: 10.0)
        return lbl
    }()
    
    lazy var imageBox: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.clipsToBounds = true
        img.layer.cornerRadius = 10
        return img
    }()
    
    private lazy var saveArticle: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "save_article"), for: .normal)
        return btn
    }()
    
    lazy var articleText: UILabel = {
        let lbl = UILabel()
        lbl.text = "News description"
        lbl.textColor = .darkGray
        lbl.numberOfLines = 0
        lbl.font = UIFont(name:"AvenirNextCondensed-Regular", size: 12.0)
        return lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    func setupCell() {
        addSubview(container)
        
        container.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, paddingTop: 4, paddingLeft: 12, paddingBottom: 4, paddingRight: 12, width: 0, height: 0)
        
        [headline, date, imageBox, articleText].forEach { container.addSubview ($0) }
        
        headline.anchor(top: container.topAnchor, leading: container.leadingAnchor, bottom: nil, trailing: container.trailingAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 80)
        date.anchor(top: headline.bottomAnchor, leading: nil, bottom: nil, trailing: headline.trailingAnchor, paddingTop: 4, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 20)
        imageBox.anchor(top: date.bottomAnchor, leading: headline.leadingAnchor, bottom: nil, trailing: headline.trailingAnchor, paddingTop: 4, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 200)
        articleText.anchor(top: imageBox.bottomAnchor, leading: imageBox.leadingAnchor, bottom: container.bottomAnchor, trailing: imageBox.trailingAnchor, paddingTop: 4, paddingLeft: 0, paddingBottom: 4, paddingRight: 0, width: 0, height: 0)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
