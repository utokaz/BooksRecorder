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

class BookInformationEditVC: BaseVC {
    
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
    @IBOutlet weak var DraggTopConstraints: NSLayoutConstraint!
    @IBOutlet weak var DraggBottomConstraints: NSLayoutConstraint!
    @IBOutlet weak var headerSpaceHeightConstrants: NSLayoutConstraint!
    @IBOutlet weak var scrollView: UIScrollView!
    
    let disposeBag = DisposeBag()
    let realm = try? Realm()
    var item: BookModel!
    weak var delegate: BookInformationEditVCDelegate?
    var type: InfoType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataBinding()
        uiConfig()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // キーボードの監視
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self,
                                                  name: UIResponder.keyboardWillShowNotification,
                                                  object: self.view.window)
        NotificationCenter.default.removeObserver(self,
                                                  name: UIResponder.keyboardDidHideNotification,
                                                  object: self.view.window)
    }
    
    private func dataBinding() {
        saveButton.rx.tap.asDriver().drive(onNext: { [weak self] in
            BookModel.setData(model: self?.item, memo: self?.memoTextView.text ?? "")
            self?.view.makeToast(self?.type == InfoType.register ? "追加されました" : "変更しました", duration: 0.2, position: .bottom) { _ in
                self?.dismiss(animated: true, completion: nil)
            }
        }).disposed(by: disposeBag)
        
        deleteButton.rx.tap.asDriver().drive(onNext: { [weak self] in
            self?.showDialog(title: "削除してよろしいですか？", message: nil, okAction: {
                                BookModel.deleteData(id: self?.item.id ?? "") {
                                    self?.view.makeToast("削除しました", duration: 0.2, position: .bottom) { _ in
                                        self?.navigationController?.popViewController(animated: true)
                                    }
                                } }, cancellAction: nil)
            
        }).disposed(by: disposeBag)
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        delegate?.viewDidDisappear()
    }
    
    private func uiConfig() {
        guard let book = item else { return }
        
        if type == InfoType.register {
            saveButton.setTitle("本棚に入れる", for: .normal)
            headerSpaceLabel.text = "本棚登録"
            deleteButton.isHidden = true
        } else {
            saveButton.setTitle("変更を保存する", for: .normal)
            headerSpaceLabel.isHidden = true
            dragg.isHidden = true
            DraggTopConstraints.constant = 0
            DraggBottomConstraints.constant = 0
            headerSpaceHeightConstrants.constant = 0
        }
        
        authorLabel.text = book.authors.first
        titleLabel.text = book.title
        descriptionLabel.text = book.descriptionStr
        if let url = URL(string: book.bookImageUrlStr) {
            bookImageView.kf.indicatorType = .activity
            bookImageView.kf.setImage(with: url)
        } else {
            bookImageView.image = UIImage(named: "noimage")
        }
        
        // すでに登録ずみのコンテンツであればメモを反映
        let realm = try? Realm()
        if let storedBook =  realm?.object(ofType: BookModel.self, forPrimaryKey: self.item?.id) {
            memoTextView.text = storedBook.memo
            saveButton.setTitle("変更する", for: .normal)
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
    func keyboardWillShow(_ notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentInset.bottom = keyboardSize.height
        }
    }
    
    @objc
    func keyboardWillHide(_ notification: NSNotification) {
        scrollView.contentInset = .zero
        scrollView.scrollIndicatorInsets = .zero
    }
    
    public func inject(item: BookModel, type: InfoType) {
        self.item = item
        self.type = type
    }
    
}
