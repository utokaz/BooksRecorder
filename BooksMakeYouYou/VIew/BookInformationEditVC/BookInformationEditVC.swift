//
//  BookInformationEditVC.swift
//  BooksMakeYouYou
//
//  Created by uto kazuori on 2020/08/23.
//  Copyright © 2020 uto kazuori. All rights reserved.
//

import UIKit
import RxSwift
import Kingfisher
import RealmSwift
import Realm
import Toast_Swift

protocol BookInformationEditVCDelegate: class {
    func viewDidDisappear()
}

class BookInformationEditVC: UIViewController {
    
    enum InfoType {
        case register
        case edit
    }
    
    @IBOutlet weak var bookImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var memoTextView: UITextView!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var dragg: UIView!
    @IBOutlet weak var headerSpace: UIView!
    @IBOutlet weak var headerSpaceLabel: UILabel!
    @IBOutlet weak var deleteButton: UIButton!
    
    let disposeBag = DisposeBag()
    let realm = try? Realm()
    var item: Item?
    weak var delegate: BookInformationEditVCDelegate?
    var type: InfoType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataBinding()
        uiConfig()
    }
    
    private func dataBinding() {
        saveButton.rx.tap.asDriver().drive(onNext: { [weak self] in
            let book = BookModel()
            let authorList = List<String>()
            self?.item?.volumeInfo.authors?.forEach { author in
                authorList.append(author)
            }
            let date: Date?
            if let storedBook = self?.realm?.object(ofType: BookModel.self, forPrimaryKey: self?.item?.id) {
                date = storedBook.savedDate
            } else {
                date = Date()
            }
            book.setData(id: (self?.item?.id)!, title: self?.item?.volumeInfo.title ?? "", authors: authorList, bookImageUrlStr: self?.item?.volumeInfo.imageLinks?.thumbnail ?? "", descriptionStr: self?.item?.volumeInfo.description ?? "", memo: self?.memoTextView.text ?? "", registerDate: date!)
            
            try? self?.realm?.write {
                // データ永続化
                self?.realm?.add(book, update: .modified)
            }
            self?.view.makeToast("追加されました", duration: 0.5, position: .bottom) { _ in
                self?.dismiss(animated: true, completion: nil)
            }
        }).disposed(by: disposeBag)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        delegate?.viewDidDisappear()
    }
    
    private func uiConfig() {
        guard let book = item else { return }
        headerSpaceLabel.text = type == InfoType.edit ? "" : "本棚登録"
        dragg.isHidden = type == InfoType.edit
        deleteButton.isHidden = type == InfoType.register
        
        authorLabel.text = book.volumeInfo.authors?.first
        titleLabel.text = book.volumeInfo.title
        descriptionLabel.text = book.volumeInfo.description
        if let urlStr = book.volumeInfo.imageLinks?.thumbnail, let url = URL(string: urlStr) {
            bookImageView.kf.indicatorType = .activity
            bookImageView.kf.setImage(with: url)
        } else {
            bookImageView.image = UIImage(named: "noimage")
        }
        
        // すでに登録ずみのコンテンツであればメモを反映
        let realm = try? Realm()
        if let storedBook =  realm?.object(ofType: BookModel.self, forPrimaryKey: self.item?.id) {
            memoTextView.text = storedBook.memo
        }
        
        dragg.layer.cornerRadius = dragg.frame.height / 2
        saveButton.backgroundColor = UIColor(named: "deepGreen")
        saveButton.layer.cornerRadius = saveButton.frame.height / 2
        saveButton.setTitleColor(.white, for: .normal)
        saveButton.tintColor = UIColor(named: "deepGreen")
        deleteButton.layer.cornerRadius = deleteButton.frame.height / 2
        deleteButton.setTitleColor(UIColor(named: "deepRed"), for: .normal)
        deleteButton.tintColor = UIColor(named: "deepRed")
        deleteButton.layer.borderColor = UIColor(named: "deepRed")?.cgColor
        deleteButton.layer.borderWidth = 2
        memoTextView.layer.borderWidth = 2
        memoTextView.layer.borderColor = UIColor(named: "deepGreen")?.cgColor
        memoTextView.layer.cornerRadius = 15
        memoTextView.textContainerInset = UIEdgeInsets(top: 15, left: 10, bottom:   15, right: 10)
        let tapped = UITapGestureRecognizer(target: self, action: #selector(closeKeyBoard))
        tapped.cancelsTouchesInView = false
        view.addGestureRecognizer(tapped)
    }
    
    @objc
    private func closeKeyBoard() {
        memoTextView.resignFirstResponder()
    }
    
    @objc
    func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            let suggestionHeight = self.view.frame.origin.y + keyboardSize.height
            self.view.frame.origin.y -= suggestionHeight
        }
    }
    
    @objc
    func keyboardWillHide() {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    public func inject(item: Item, type: InfoType) {
        self.item = item
        self.type = type
    }
    
}


