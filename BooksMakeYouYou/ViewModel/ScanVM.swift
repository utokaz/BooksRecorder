//
//  ScanVM.swift
//  BooksMakeYouYou
//
//  Created by uto kazuori on 2020/08/15.
//  Copyright © 2020 uto kazuori. All rights reserved.
//

import Foundation
import RxSwift
import RxRelay

class ScanVM {
    
    struct input {
        let triger: PublishRelay<String>
    }
    
    struct output {
        var result: Observable<Result<BooksSearchResponse, Error>>
    }
    
    func transform(input: input) -> output {
        let result = input.triger.flatMapLatest { isbm -> Observable<Result<BooksSearchResponse, Error>> in
            let request = SearchBookByKeyword(keyword: isbm, searchType: .isbn)
            let client = BookSearchClient()
            return client.send(request: request)
        }
        return output(result: result)
    }
}
