//
//  NewsTableViewCell.swift
//  TestPoint
//
//  Created by Nafis Shayakbarov on 06/06/2018.
//  Copyright © 2018 Nafis Shayakbarov. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    let authorLabel = UILabel()
    let descriptionText = UILabel()
    let urlToImg = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let marginGuide = contentView.layoutMarginsGuide
        
        // configure authorLabel
        contentView.addSubview(authorLabel)
        authorLabel.translatesAutoresizingMaskIntoConstraints = false
        authorLabel.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor, constant: 20).isActive = true
        authorLabel.topAnchor.constraint(equalTo: marginGuide.topAnchor).isActive = true
        authorLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
        authorLabel.numberOfLines = 0
        authorLabel.font = UIFont(name: "GillSans-SemiBold", size: 14)

        // configure descriptionText
        contentView.addSubview(descriptionText)
        descriptionText.translatesAutoresizingMaskIntoConstraints = false
        descriptionText.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
        descriptionText.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
        descriptionText.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 5.0).isActive = true
        descriptionText.numberOfLines = 0
        descriptionText.font = UIFont(name: "GillSans-LightItalic", size: 13)
        descriptionText.textColor = UIColor.gray
        
        // configure descriptionText
        contentView.addSubview(urlToImg)
        urlToImg.translatesAutoresizingMaskIntoConstraints = false
        urlToImg.topAnchor.constraint(equalTo: descriptionText.bottomAnchor, constant: 5.0).isActive = true
        urlToImg.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
        urlToImg.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
        urlToImg.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor).isActive = true
        urlToImg.numberOfLines = 0
        urlToImg.font = UIFont(name: "AlNile", size: 12)
        urlToImg.textColor = UIColor.blue

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
