//
//  SideMenuVC.swift
//  BooksMakeYouYou
//
//  Created by uto kazuori on 2020/10/17.
//  Copyright © 2020 uto kazuori. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class SideMenuVC: UIViewController {
    
    @IBOutlet weak var backupBtn: UIButton!
    @IBOutlet weak var restoreBtn: UIButton!
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uiConfig()
        bindingData()
    }
    
    private func bindingData() {
        backupBtn.rx.tap.subscribe(onNext: {
            print("backup button tapped")
        }).disposed(by: disposeBag)
        restoreBtn.rx.tap.subscribe(onNext: {
            print("restore button tapped")
        }).disposed(by: disposeBag)
    }
    
    private func uiConfig() {
        backupBtn.layer.cornerRadius = backupBtn.frame.height / 2
        restoreBtn.layer.cornerRadius = restoreBtn.frame.height / 2
    }

}
