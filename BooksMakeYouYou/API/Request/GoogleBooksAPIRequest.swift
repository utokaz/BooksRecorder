//
//  OpenBDRequest.swift
//  BooksMakeYouYou
//
//  Created by uto kazuori on 2020/08/19.
//  Copyright © 2020 uto kazuori. All rights reserved.
//

import Foundation

protocol GoogleBooksAPIRequest {
    var baseURL: URL { get }
    var queryItems: [URLQueryItem] { get }
}

extension GoogleBooksAPIRequest {
    var baseURL: URL {
        return URL(string: "https://www.googleapis.com/books/v1/volumes")!
    }
    
    func buildRequest() -> URLRequest {
        var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        components?.queryItems = queryItems
        var request = URLRequest(url: baseURL)
        request.url = components?.url
        request.httpMethod = "GET"
        return request
    }
    
    func response(data: Data, response: HTTPURLResponse) throws -> BooksSearchResponse? {
        if (200..<300).contains(response.statusCode) {
            let jsonDecoder = JSONDecoder()
            return try jsonDecoder.decode(BooksSearchResponse.self, from: data)
        } else {
            return nil
        }
    }
}
