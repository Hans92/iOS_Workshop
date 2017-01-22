//
//  NewsParser.swift
//  PJRSS
//
//  Created by Kuba Reinhard on 17.01.2017.
//  Copyright © 2017 Koło SUM. All rights reserved.
//

import Foundation

class NewsParser {
    
    class func parseNews(with data: Data) -> [NewsInfo]? {
        do {
            if let jsonResults: [[String : AnyObject]] = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as? [[String : AnyObject]] {
                
                var newsInfoArray: [NewsInfo] = []
                
                for result: [String : AnyObject] in jsonResults {
                    if let name: String = result["name"] as? String,
                        let link: String = result["link"] as? String,
                        let id: Int = result["id"] as? Int,
                        let dateDouble: Double = result["timestamp"] as? Double {
                        
                        let date: Date = Date(timeIntervalSince1970: dateDouble)
                        let news: NewsInfo = NewsInfo(id: id, title: name, link: link, date: date)
                        newsInfoArray.append(news)
                        
                    } else {
                        print("Can't parse: ", result)
                    }
                }
                
                print("Count of news info objects", newsInfoArray.count)
                return newsInfoArray
            } else {
                return nil
            }
        } catch {
            print("Error parsing json")
            return nil
        }
    }
}
