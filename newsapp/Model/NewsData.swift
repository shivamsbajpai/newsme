//
//  NewsData.swift
//  newsapp
//
//  Created by Shivam on 13/09/20.
//  Copyright © 2020 Shivam. All rights reserved.
//

import Foundation

struct NewsData: Codable {
    //let totalResults: Int
    let articles: [Articles]
}
struct Articles: Codable {
    let publishedAt: String
    let title: String
    let content: String?
    let author: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let source: Source
}
struct Source: Codable {
    let id: String?
}
