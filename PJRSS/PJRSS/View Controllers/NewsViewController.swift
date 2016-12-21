//
//  NewsViewController.swift
//  PJRSS
//
//  Created by Kuba Reinhard on 17.12.2016.
//  Copyright © 2016 Koło SUM. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController {
    
    @IBOutlet weak var newsTableView: UITableView!
    
    fileprivate var news: [News] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.newsTableView.dataSource = self
        self.newsTableView.delegate = self
        
        
        let news1: News = News(date: "16/11/1992", title: "Nintendo Switch", description: "Nintendo is doing something interesting with its next console, the Switch, which is targeting a March 2017 release window.", imageName: "news1.png")
        
        let news2: News = News(date: "10/12/2016", title: "Super Mario Run sees 37 million downloads, $14 million in revenue in first 3 days", description: "Nintendo’s investors haven’t been happy with the performance of the new iPhone game, “Super Mario Run,” which has led to falling share prices over concerns with the game’s payment model.", imageName: "news2.jpg")
        
        let news3: News = News(date: "22/12/2016", title: "EFF urges companies to prepare for more surveillance", description: "The Electronic Frontier Foundation – a group of tech pioneers trying to keep the Internet open and free – have published an open letter to tech companies pleading them to prepare for an era of increased Internet surveillance and censorship.", imageName: "news3.png")
        
        self.news = [news1, news2, news3]
    }
}

extension NewsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: NewsTableViewCell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.cellId) as? NewsTableViewCell else {
            return UITableViewCell()
        }
        
        let news: News = self.news[indexPath.row]
        
        cell.newsTitleLabel.text = news.title
        cell.descriptionLabel.text = news.description
        
        if let image: UIImage = UIImage(named: news.imageName) {
            cell.newsImageView.image = image
            cell.newsImageView.contentMode = .scaleAspectFill
            cell.newsImageView.clipsToBounds = true
        }
        
        return cell
    }
}

extension NewsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}
