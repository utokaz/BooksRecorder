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
    
    func setData(id: String, title: String, authors: List<String>, bookImageUrlStr: String, descriptionStr: String, memo: String, registerDate: Date) {
        self.id = id
        self.title = title
        self.authors = authors
        self.bookImageUrlStr = bookImageUrlStr
        self.descriptionStr = descriptionStr
        self.memo = memo
        self.savedDate = registerDate
    }
    
    func entityToModel(item: Item) -> BookModel {
        let model = BookModel()
        model.id = item.id
        model.title = item.volumeInfo.title ?? ""
        let authors = List<String>()
        item.volumeInfo.authors?.forEach { authors.append($0) }
        model.authors = authors
        model.bookImageUrlStr = item.volumeInfo.imageLinks?.thumbnail ?? ""
        return model
    }
    
    override static func primaryKey() -> String? {
      return "id"
    }
}
