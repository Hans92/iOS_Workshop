//
//  NewsAPI.swift
//  PJRSS
//
//  Created by Kuba Reinhard on 17.01.2017.
//  Copyright © 2017 Koło SUM. All rights reserved.
//

import Foundation

fileprivate enum NewsAPIEndpoint: String {
    case news = "/news"
    case details = "/details?link="
}

final class NewsAPI {
    
    private static let baseUrl: String = "https://thawing-dawn-85279.herokuapp.com"
    
    private func performRequest(endpoint: NewsAPIEndpoint, parameters: String? = nil, success: @escaping (Data) -> (), failure: @escaping (Error) -> ()) {
        
        var urlString: String = NewsAPI.baseUrl + endpoint.rawValue
        
        if let parameters: String = parameters {
            urlString += parameters
        }
        
        guard let url: URL = URL(string: urlString) else { return failure(NSError(domain: "nasza domena", code: 666, userInfo: nil)) }
        
        var request: URLRequest = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let session: URLSession = URLSession.shared
        session.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
            
            DispatchQueue.main.async {
                if let data: Data = data {
                    success(data)
                }
                
                if let error: Error = error {
                    failure(error)
                }
            }
            }.resume()
    }
    
    func getNewsList(success: @escaping ([NewsInfo]) -> (), failure: @escaping (Error) -> ()) {
        self.performRequest(endpoint: .news, success: { (data: Data) in
            if let newsArray: [NewsInfo] = NewsParser.parseNews(with: data) {
                success(newsArray)
            } else {
                success([])
            }
        }, failure: failure)
    }
}
