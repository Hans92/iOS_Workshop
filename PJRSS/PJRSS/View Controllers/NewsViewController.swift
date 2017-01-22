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
    
    fileprivate var news: [NewsInfo] = []
    private let api: NewsAPI = NewsAPI()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.newsTableView.dataSource = self
        self.newsTableView.delegate = self
        
        self.api.getNewsList(success: { [weak self] (newsArray: [NewsInfo]) in
            self?.news = newsArray
            self?.newsTableView.reloadData()
        }) { (error: Error) in
            print(error)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier: String = segue.identifier else { return }
        
        switch identifier {
        case "showNewsDetails":
            if let vc: NewsDetailsViewController = segue.destination as? NewsDetailsViewController,
                let news: News = sender as? News {
                vc.news = news
            }
        default:
            break
        }
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
        
        let news: NewsInfo = self.news[indexPath.row]
        
        cell.newsTitleLabel.text = news.title
        //        cell.descriptionLabel.text = news.description
        
        //        if let image: UIImage = UIImage(named: news.imageName) {
        //            cell.newsImageView.image = image
        //            cell.newsImageView.contentMode = .scaleAspectFill
        //            cell.newsImageView.clipsToBounds = true
        //        }
        
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //        let news: News = self.news[indexPath.row]
        //        self.performSegue(withIdentifier: "showNewsDetails", sender: news)
    }
}
