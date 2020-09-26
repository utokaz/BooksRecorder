//
//  SearchVC.swift
//  BooksMakeYouYou
//
//  Created by uto kazuori on 2020/08/14.
//  Copyright © 2020 uto kazuori. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxRelay
import PKHUD

class SearchVC: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    var isLoading =  PublishRelay<Bool>()
    
    var items = [Item]()
    
    let disposeBag = DisposeBag()
    let searchTrigger = PublishRelay<String>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataBinding()
        uiConfig()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if items.count == 0 {
            focusSearchBar()
        }
    }
    
    private func dataBinding() {
        let vm = SearchVM()
        let output = vm.transform(input: .init(triger: searchTrigger))
        output.result.subscribe { [weak self] reslt in
            self?.isLoading.accept(false)
            switch reslt.element {
            case .success(let res):
                self?.items = res.items
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
                DispatchQueue.main.async {
                    self?.items = [Item]()
                    self?.tableView.reloadData()
                }
            default: break
            }
        }.disposed(by: disposeBag)
        
        isLoading.bind(to: Binder(self) {_,flag in
            flag ? HUD.show(.progress) : HUD.hide()
        }).disposed(by: disposeBag)
    }
    
    private func uiConfig() {
        title = "検索"
        searchBar.autocapitalizationType = .none
        searchBar.tintColor = UIColor(named: "deepGreen")
        searchBar.delegate = self
        searchBar.backgroundImage = UIImage()
        searchBar.placeholder = "タイトルや著者名を入力"
        
        tableView.register(UINib(nibName: "SearchVCTableViewCell", bundle: nil), forCellReuseIdentifier: "searchResultCell")
        tableView.delegate = self
        tableView.dataSource = self
        
        let tapped = UITapGestureRecognizer(target: self, action: #selector(closeKeyBoard))
        tapped.cancelsTouchesInView = false
        tableView.addGestureRecognizer(tapped)
    }
    
    func focusSearchBar() {
        searchBar.becomeFirstResponder()
    }
    
    @objc
    func closeKeyBoard() {
        self.view.endEditing(true)
    }
}

extension SearchVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchResultCell") as! SearchVCTableViewCell
        if let urlStr = items[cellForRowAt.row].volumeInfo.imageLinks?.smallThumbnail {
            cell.config(imageURL: URL(string: urlStr), title: items[cellForRowAt.row].volumeInfo.title, author: items[cellForRowAt.row].volumeInfo.authors?.first)
        } else {
            cell.config(image: UIImage(named: "noimage"), title: items[cellForRowAt.row].volumeInfo.title, author: items[cellForRowAt.row].volumeInfo.authors?.first)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "BookInformationEditVC", bundle: nil)
        let vc = sb.instantiateInitialViewController() as! BookInformationEditVC
        let model = BookModel.entityToModel(item: items[indexPath.row])
        vc.inject(item: model, type: .register)
        self.present(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70.0
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.view.endEditing(true)
    }
}

extension SearchVC: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // 検索小窓が0文字になったらテーブルのセルを消去
        if searchText.count == 0 {
            items = [Item]()
            self.tableView.reloadData()
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let text = searchBar.text, text != "" {
            self.isLoading.accept(true)
            self.searchTrigger.accept(text)
            self.searchBar.resignFirstResponder()
        }
    }
}
