//
//  NewsDetailsViewController.swift
//  PJRSS
//
//  Created by Kuba Reinhard on 10.01.2017.
//  Copyright © 2017 Koło SUM. All rights reserved.
//

import UIKit

class NewsDetailsViewController: UIViewController {
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var textLabel: UILabel!
    
    var news: News?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let news: News = self.news {
            self.titleLabel.text = news.title
            self.dateLabel.text = news.date
            self.textLabel.text = news.description
            
            if let image: UIImage = UIImage(named: news.imageName) {
                self.imageView.image = image
            }
            
            self.title = news.title
        }
    }
}
