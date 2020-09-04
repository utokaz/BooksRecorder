//
//  BookModel.swift
//  BooksMakeYouYou
//
//  Created by uto kazuori on 2020/09/01.
//  Copyright © 2020 uto kazuori. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

class BookModel: Object {
    @objc dynamic var id: String = ""
    @objc dynamic var title: String = ""
    var authors = List<String>()
    @objc dynamic var bookImageUrlStr: String = ""
    @objc dynamic var descriptionStr: String = ""
    @objc dynamic var memo: String = ""
    @objc dynamic var savedDate: Date?
    
    static func entityToModel(item: Item) -> BookModel {
        let model = BookModel()
        model.id = item.id
        model.title = item.volumeInfo.title ?? ""
        let authors = List<String>()
        item.volumeInfo.authors?.forEach { authors.append($0) }
        model.authors = authors
        model.bookImageUrlStr = item.volumeInfo.imageLinks?.thumbnail ?? ""
        model.descriptionStr = item.volumeInfo.description ?? ""
        return model
    }
    
    static func setData(model: BookModel?, memo: String) {
        let date: Date?
        let realm = try? Realm()
        if let storedBook = realm?.object(ofType: BookModel.self, forPrimaryKey: model?.id) {
            date = storedBook.savedDate
        } else {
            date = Date()
        }
        
        try? realm?.write {
            // データ永続化
            model?.memo = memo
            model?.savedDate = date
            if let model = model {
                realm?.add(model, update: .modified)
            }
        }
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
