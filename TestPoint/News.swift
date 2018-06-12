//
//  News.swift
//  TestPoint
//
//  Created by Nafis Shayakbarov on 06/06/2018.
//  Copyright © 2018 Nafis Shayakbarov. All rights reserved.
//

import UIKit

class News: NSObject {
    
    let author: String
    let descriptionNews: String
    let urlToImage: String
    
    init(author: String, descriptionNews: String, urlToImage: String) {
        self.author = author
        self.descriptionNews = descriptionNews
        self.urlToImage = urlToImage
    }
    
}
