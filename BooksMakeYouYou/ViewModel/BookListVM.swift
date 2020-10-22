//
//  BookListVM.swift
//  BooksMakeYouYou
//
//  Created by uto kazuori on 2020/10/17.
//  Copyright © 2020 uto kazuori. All rights reserved.
//

import Foundation
import RxSwift
import RxRelay
import RealmSwift

class BookListVM {
    struct input {
        let trigger: PublishRelay<Void>
    }
    
    struct output {
        let result: Observable<Results<BookModel>>
    }
    
    func transform(input: input) -> output {
        let result = input.trigger.flatMapLatest({ return Realm.all(type: BookModel.self) })
        return output(result: result)
    }
}
