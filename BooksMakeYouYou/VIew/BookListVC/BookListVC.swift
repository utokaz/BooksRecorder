//
//  BookListVC.swift
//  BooksMakeYouYou
//
//  Created by uto kazuori on 2020/08/14.
//  Copyright © 2020 uto kazuori. All rights reserved.
//

import UIKit
import RxSwift
import Realm
import RealmSwift

class BookListVC: UIViewController {
    
    @IBOutlet weak var bookCollectionView: UICollectionView!
    
    let disposeBag = DisposeBag()
    var storedData: Results<BookModel>? {
        let realm = try? Realm()
        return realm?.objects(BookModel.self).sorted(byKeyPath: "savedDate", ascending: false)
    }
    private var token: NotificationToken!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bookCollectionView.register(UINib(nibName: "BookCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "BookCollectionViewCell")
        bookCollectionView.delegate = self
        bookCollectionView.dataSource = self
        // realmの状態を監視
        token = self.storedData?.observe(on: .main, {_ in
            self.bookCollectionView.reloadData()
        })
        uiConfig()
    }
    
    deinit {
        token.invalidate()
    }
    
    func uiConfig() {
        title = "本棚"
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: self.view.frame.width / 2, height: (self.view.frame.width / 2) * 1.4)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 20
        bookCollectionView.collectionViewLayout = layout
    }
    
    func scrollToTop() {
        bookCollectionView.setContentOffset(CGPoint.zero, animated: true)
    }
}

extension BookListVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        storedData?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = bookCollectionView.dequeueReusableCell(withReuseIdentifier: "BookCollectionViewCell", for: indexPath) as! BookCollectionViewCell
        cell.config(title: storedData?[indexPath.row].title, author: storedData?[indexPath.row].authors.first, bookImageUrl: storedData?[indexPath.row].bookImageUrlStr)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "BookInformationEditVC", bundle: nil)
        let vc = sb.instantiateInitialViewController() as! BookInformationEditVC
        guard let data = storedData?[indexPath.row] else { return }
        vc.inject(item: data, type: .edit)
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
