//
//  SearchBookByKeyword.swift
//  BooksMakeYouYou
//
//  Created by uto kazuori on 2020/08/22.
//  Copyright © 2020 uto kazuori. All rights reserved.
//

import Foundation

class SearchBookByKeyword: GoogleBooksAPIRequest {
    var queryItems: [URLQueryItem]
    
    init(keyword: String, startIndex: String) {
        self.queryItems = [URLQueryItem(name: "q", value: keyword), URLQueryItem(name: "startIndex", value: startIndex)]
    }
    
    init(isbn: String) {
        self.queryItems = [URLQueryItem(name: "q", value: "isbn:\(isbn)")]
    }
}
