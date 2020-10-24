//
//  WebServicces.swift
//  1News
//
//  Created by cihan bas on 24.10.2020.
//

import Foundation
class WebServices {
    func getArticles(url:URL, completion: @escaping([NewsModel]?)->()){
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            }
            else if let tt = data {
                let articles = try? JSONDecoder().decode(ArticleList.self, from: tt)
                if let articleList = articles{
                    completion(articleList.articles)
                } 
            }
        }.resume()
        
    }
}
