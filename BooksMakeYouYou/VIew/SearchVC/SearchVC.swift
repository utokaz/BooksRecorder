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

class SearchVC: BaseVC {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
    
    var items = [Item]()
    
    let disposeBag = DisposeBag()
    let searchTrigger = PublishRelay<(String, Int)>()
    var pageCounter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uiConfig()
        dataBinding()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if items.count == 0 {
            focusSearchBar()
        }
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
    
    private func dataBinding() {
        let vm = SearchVM()
        let output = vm.transform(input: .init(triger: searchTrigger))
        
        output.result.subscribe { [weak self] reslt in
            switch reslt.element {
            case .success(let res):
                DispatchQueue.main.async {
                    self?.items += res.items
                    self?.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
                DispatchQueue.main.async {
                    self?.items = []
                    self?.tableView.reloadData()
                }
            default: break
            }
        }.disposed(by: disposeBag)

        
        tableView.rx.reachedBottom.withLatestFrom(output.isLoading)
            .filter{ !$0 }.observeOn(MainScheduler.asyncInstance)
            .subscribe(onNext: { [weak self] _ in
                if let text = self?.searchBar.text, text != "" {
                    guard let self = self else { return }
                    print("reached bottom api execute start")
                    self.pageCounter += 1
                    self.searchTrigger.accept((text, self.pageCounter))
                }
            }).disposed(by: disposeBag)
        
        output.isLoading.subscribe(onNext: {
            print("searchVC loading is", $0)
        }).disposed(by: disposeBag)
        
        output.isLoading
            .observeOn(MainScheduler.instance)
            .bind(to: indicatorView.rx.isAnimating)
            .disposed(by: disposeBag)
        
        output.isLoading
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] in
                self?.tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: $0 ? 50 : 0, right: 0)
            })
            .disposed(by: disposeBag)
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
            // レスポンスにimageURLがない場合
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
            items = []
            self.tableView.reloadData()
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let text = searchBar.text, text != "" {
            items = []
            pageCounter = 0
            self.searchTrigger.accept((text, pageCounter))
            self.searchBar.resignFirstResponder()
        }
    }
}
