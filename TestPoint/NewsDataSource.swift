//
//  NewsDataSource.swift
//  TestPoint
//
//  Created by Nafis Shayakbarov on 06/06/2018.
//  Copyright © 2018 Nafis Shayakbarov. All rights reserved.
//

import UIKit

class NewsDataSource: NSObject {
    
    class func newsList() -> [News] {
        let newsList = [
            News(author: "Scott Scanlon", descriptionNews: "Crypto Briefing exists to advocate for the safe and responsible integration of blockchain and cryptocurrency into mainstream life. We believe. Our goal is to grow the crypto community – to help new converts understand the basics, and to help more experienced …", urlToImage: "https://www.youbrandinc.com/wp-content/uploads/2018/05/Bitcoin-Trademarked-In-The-UK-In-Patent-Troll-Style-Action-1024x538.jpg"),
            News(author: "Harry Potter and the Philosopher's Stone", descriptionNews: "Harry Potter and the Philosopher's Stone is the first novel in the Harry Potter series and J. K. Rowling's debut novel, first published in 1997 by Bloomsbury. It was published in the United States as Harry Potter and the Sorcerer's Stone by Scholastic Corporation in 1998. The plot follows Harry Potter, a young wizard who discovers his magical heritage as he makes close friends and a few enemies in his first year at the Hogwarts School of Witchcraft and Wizardry.", urlToImage: "https://www.youbrandinc.com/wp-content/uploads/2018/05/Bitcoin-Trademarked-In-The-UK-In-Patent-Troll-Style-Action-1024x538.jpg"),
            News(author: "The Monstrumologist", descriptionNews: "The Monstrumologist (2009) is a young adult horror novel by Rick Yancey. It received the 2010 Michael L. Printz Honor Award for excellence in young adult literature.", urlToImage: "https://www.youbrandinc.com/wp-content/uploads/2018/05/Bitcoin-Trademarked-In-The-UK-In-Patent-Troll-Style-Action-1024x538.jpg"),
            News(author: "Nineteen Eighty-Four", descriptionNews: "Nineteen Eighty-Four, often published as 1984, is a dystopian novel by English author George Orwell published in 1949. The novel is set in Airstrip One (formerly known as Great Britain), a province of the superstate Oceania in a world of perpetual war, omnipresent government surveillance and public manipulation, dictated by a political system euphemistically named English Socialism (or Ingsoc in the government's invented language, Newspeak) under the control of a privileged elite of the Inner Party, that persecutes individualism and independent thinking as thoughtcrime.", urlToImage: "https://www.youbrandinc.com/wp-content/uploads/2018/05/Bitcoin-Trademarked-In-The-UK-In-Patent-Troll-Style-Action-1024x538.jpg")
        ]
        return newsList
    }
    
}
