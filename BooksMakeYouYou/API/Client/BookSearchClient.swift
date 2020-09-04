//
//  BookSearchClient.swift
//  BooksMakeYouYou
//
//  Created by uto kazuori on 2020/08/22.
//  Copyright © 2020 uto kazuori. All rights reserved.
//

import Foundation
import RxSwift

class BookSearchClient {
    
    public func send(request: GoogleBooksAPIRequest) -> Observable<Result<BooksSearchResponse, Error>>  {
        let urlRequest = request.buildRequest()
        return Observable<Result<BooksSearchResponse, Error>>.create { observer in
            
            let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
                if let  error = error {
                    observer.onNext(.failure(error))
                } else {
                    do {
                        let response = try request.response(data: data!, response: response as! HTTPURLResponse)
                        if let response = response {
                            observer.onNext(.success(response))
                        } else {
                            /// デコードエラー
                            observer.onNext(.failure(GoogleBookError()))
                        }
                    } catch {
                        observer.onNext(.failure(GoogleBookError()))
                    }
                }
            }
            task.resume()
            return Disposables.create {
                task.cancel()
            }
        }
        
    }
}

class GoogleBookError: Error {}
