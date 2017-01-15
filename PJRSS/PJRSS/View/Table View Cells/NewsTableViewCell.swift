//
//  NewsTableViewCell.swift
//  PJRSS
//
//  Created by Kuba Reinhard on 17.12.2016.
//  Copyright © 2016 Koło SUM. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    static let cellId: String = "NewsTableViewCellID"
    
    @IBOutlet weak var newsTitleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var newsImageView: UIImageView!
}
