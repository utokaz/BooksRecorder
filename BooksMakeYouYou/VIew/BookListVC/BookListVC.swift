//
//  BookListVC.swift
//  BooksMakeYouYou
//
//  Created by uto kazuori on 2020/08/14.
//  Copyright © 2020 uto kazuori. All rights reserved.
//

import UIKit
import RxSwift
import RxRelay
import Realm
import RealmSwift
import SideMenu

enum PickerList: Int, CaseIterable {
    case none
    case defaultSort
    case writerNameSort
    case titleSort
    
    var title: String {
        switch self {
        case .none:
            return ""
        case .defaultSort:
            return "追加日の順番に並び替える"
        case .writerNameSort:
            return "作者順に並び替える"
        case .titleSort:
            return "タイトル順に並び替える"
        }
    }
    var shortHand: String {
        switch self {
        case .none:
            return "並び替える"
        case .defaultSort:
            return "追加日順"
        case .writerNameSort:
            return "作者順"
        case .titleSort:
            return "タイトル順"
        }
    }
}

class BookListVC: BaseVC {
    
    @IBOutlet weak var bookCollectionView: UICollectionView!
    @IBOutlet weak var noBookMessageLbl: UILabel!
    @IBOutlet weak var sortTF: UITextField!
    @IBOutlet weak var sortArrowImageView: UIImageView!
    @IBOutlet weak var sortZoneHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var sortZoneView: UIView!
    
    let trigger = PublishRelay<Void>()
    let disposeBag = DisposeBag()
    
    var storedData: Results<BookModel>?
    private var token: NotificationToken!
    private var selectedSortType: PickerList?
    
    deinit {
        token.invalidate()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataBinding()
        trigger.accept(())
        
        bookCollectionView.register(UINib(nibName: "BookCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "BookCollectionViewCell")
        bookCollectionView.delegate = self
        bookCollectionView.dataSource = self
        
        // realmの状態を監視
        token = self.storedData?.observe(on: .main, {[weak self] _ in
            let isStoredDataEmpty = self?.storedData?.count == 0
            self?.noBookMessageLbl.isHidden = !isStoredDataEmpty
            self?.sortZoneView.isHidden = isStoredDataEmpty
            self?.sortZoneHeightConstraint.constant = isStoredDataEmpty ? 0 : 50
            self?.bookCollectionView.reloadData()
        })
        uiConfig()
    }
    
    func dataBinding() {
        let vm = BookListVM()
        let output = vm.transform(input: .init(trigger: trigger))
        
        output.result.subscribe(onNext: { books in
            self.storedData = books.sorted(byKeyPath: "savedDate", ascending: false)
        }).disposed(by: disposeBag)
    }
    
    func uiConfig() {
        title = "本棚"
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: self.view.frame.width / 2, height: (self.view.frame.width / 2) * 1.4)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 20
        bookCollectionView.collectionViewLayout = layout
        
        let leftButton = UIButton(type: .custom)
        leftButton.setImage(UIImage(systemName: "folder"), for: .normal)
        leftButton.addTarget(self, action: #selector(showMenu), for: .touchUpInside)
        let leftBarButtonItem = UIBarButtonItem(customView: leftButton)
        navigationItem.setLeftBarButton(leftBarButtonItem, animated: true)
        
        //  sidemenuのセッっティング
        let sb = UIStoryboard(name: "SideMenuVC", bundle: nil)
        let vc = sb.instantiateInitialViewController() as! SideMenuVC
        let leftMenuNavigationController = SideMenuNavigationController(rootViewController: vc)
        leftMenuNavigationController.menuWidth = self.view.frame.width / 2
        leftMenuNavigationController.statusBarEndAlpha = 0
        leftMenuNavigationController.presentationStyle.presentingEndAlpha = 0.8
        SideMenuManager.default.leftMenuNavigationController = leftMenuNavigationController
        SideMenuManager.default.addPanGestureToPresent(toView: self.navigationController!.navigationBar)
        SideMenuManager.default.addPanGestureToPresent(toView: self.navigationController!.view)
        
        sortTF.layer.borderWidth = 1
        sortTF.layer.cornerRadius = 6
        sortTF.layer.borderColor = UIColor(named: "lightGreen")?.cgColor
        let picker = UIPickerView()
        picker.dataSource = self
        picker.delegate = self
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 35))
        let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(pickerDone))
        let cancelItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(pickerCancell))
        doneItem.setTitleTextAttributes([.foregroundColor: UIColor(named: "lightGreen")!], for: .normal)
        cancelItem.setTitleTextAttributes([.foregroundColor: UIColor(named: "lightGreen")!], for: .normal)
        
        toolbar.setItems([cancelItem, doneItem], animated: true)
        sortTF.inputView = picker
        sortTF.inputAccessoryView = toolbar
        sortTF.delegate = self
    }
    
    @objc
    func pickerDone() {
        sortTF.endEditing(true)
        if let sortType = selectedSortType {
            switch sortType {
            case .none:
                break
            case .defaultSort:
                storedData = storedData?.sorted(byKeyPath: "savedDate", ascending: false)
            case .titleSort:
                storedData = storedData?.sorted(byKeyPath: "title", ascending: false)
            case .writerNameSort:
                storedData = storedData?.sorted(byKeyPath: "authors", ascending: false)
            }
            bookCollectionView.reloadData()
        }
    }
    
    @objc
    func pickerCancell() {
        sortTF.endEditing(true)
    }
    
    @objc
    func showMenu() {
        let sb = UIStoryboard(name: "SideMenuVC", bundle: nil)
        let vc = sb.instantiateInitialViewController() as! SideMenuVC
        let leftMenuNavigationController = SideMenuNavigationController(rootViewController: vc)
        leftMenuNavigationController.menuWidth = self.view.frame.width / 2
        leftMenuNavigationController.statusBarEndAlpha = 0
        leftMenuNavigationController.leftSide = true
        leftMenuNavigationController.presentationStyle.presentingEndAlpha = 0.8
        present(leftMenuNavigationController, animated: true, completion: nil)
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

extension BookListVC: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        PickerList.allCases.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return PickerList(rawValue: row)?.title
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let picker = PickerList(rawValue: row)
        sortTF.text = picker?.shortHand
        selectedSortType = picker
    }
}

extension BookListVC: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveLinear, animations: {
            self.sortArrowImageView.transform = CGAffineTransform.init(rotationAngle: 90 * CGFloat.pi / 180)
        }, completion: nil)
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveLinear, animations: {
            self.sortArrowImageView.transform = CGAffineTransform.identity
        }, completion: nil)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        false
    }
}
