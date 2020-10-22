//
//  SearchVM.swift
//  BooksMakeYouYou
//
//  Created by uto kazuori on 2020/08/22.
//  Copyright © 2020 uto kazuori. All rights reserved.
//

import Foundation
import RxSwift
import RxRelay
import RxCocoa

class SearchVM {
    
    struct input {
        let triger: PublishRelay<(String, Int)>
    }
    
    struct output {
        var result: Observable<Result<BooksSearchResponse, Error>>
        var isLoading: Observable<Bool>
     }
    
    func transform(input: input) -> output {
        let result = input.triger.flatMapLatest { trigger -> Observable<Result<BooksSearchResponse, Error>> in
            let request = SearchBookByKeyword(keyword: trigger.0, startIndex: String(trigger.1))
            let client = BookSearchClient()
            return client.send(request: request)
        }.share()
        
        let isLoading = Observable.merge(input.triger.asObservable().mapToTrue(), result.mapToFalse()).share()
        
        return output(result: result, isLoading: isLoading)
    }
}
