//
//  NewsModel.swift
//  1News
//
//  Created by cihan bas on 22.10.2020.
//

import Foundation
struct ArticleList: Decodable {
    var articles : [NewsModel]
}
struct NewsModel: Decodable {
    let title: String
    let description: String
    let publishedAt: String
    let content: String
} 
