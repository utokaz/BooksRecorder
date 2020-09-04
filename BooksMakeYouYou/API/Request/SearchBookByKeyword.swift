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
    
    init(keyword: String, searchType: SearchType) {
        switch searchType {
        case .isbn:
            self.queryItems = [URLQueryItem(name: "q", value: "isbn:\(keyword)")]
        case .keyword:
            self.queryItems = [URLQueryItem(name: "q", value: keyword), URLQueryItem(name: "startIndex", value: "0")]
        }
        
    }
}

enum SearchType {
    case isbn
    case keyword
}
