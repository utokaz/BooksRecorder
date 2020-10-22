//
//  RealmHelper.swift
//  BooksMakeYouYou
//
//  Created by uto kazuori on 2020/10/17.
//  Copyright © 2020 uto kazuori. All rights reserved.
//

import Foundation
import RealmSwift
import RxSwift


public extension Realm {

    static func all<T>(type: T.Type) -> Observable<Results<T>> where T : Object {
        return Observable.create { observer in
            do {
                let realm = try Realm()
                let objects = realm.objects(type)
                observer.onNext(objects)
                observer.onCompleted()
            } catch let error {
                observer.onError(error)
            }
            return Disposables.create()
        }
    }
}
