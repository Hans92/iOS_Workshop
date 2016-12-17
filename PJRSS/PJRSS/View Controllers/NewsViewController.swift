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
    
    fileprivate let colors: [String] = ["Blue", "Yellow", "Black", "Green", "Magenta", "Purple", "Gray", "Cyan", "Orange", "Beige", "Pink", "😃", "😡", "😩", "💛", "💌", "🍎", "😀", "😃", "😄", "😁", "😆", "😅", "😂", "🤣", "☺️", "😊", "😇", "🙂", "🙃", "😉", "😌"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.newsTableView.dataSource = self
        self.newsTableView.delegate = self
        
        var word: String?
        word = "Some word"
        print(word)
        
        print(word ?? "NOPE")
        
        if let safeWord: String = word {
            print(safeWord)
        }
        
        guard let safeWord2: String = word else { return }
        print(safeWord2)
    }
}

extension NewsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: NewsTableViewCell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.cellId) as? NewsTableViewCell else {
            return UITableViewCell()
        }
        
        let string: String = self.colors[indexPath.row]
        cell.newsTitleLabel.text = "\(string) - cell number \(indexPath.row)"
        cell.newsTitleLabel.textColor = UIColor.black
        
        switch indexPath.row % 3 {
        case 0:
            cell.backgroundColor = UIColor.red.withAlphaComponent(0.2)
        case 1:
            cell.backgroundColor = UIColor.green.withAlphaComponent(0.2)
        case 2:
            cell.backgroundColor = UIColor.blue.withAlphaComponent(0.2)
        default:
            break
        }
        
        return cell
    }
}

extension NewsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row % 3 {
        case 0:
            return 50.0
        case 1:
            return 75.0
        case 2:
            return 100.0
        default:
            return 44.0
        }
    }
}
