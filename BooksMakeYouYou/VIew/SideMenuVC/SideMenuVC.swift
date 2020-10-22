//
//  SideMenuVC.swift
//  BooksMakeYouYou
//
//  Created by uto kazuori on 2020/10/17.
//  Copyright © 2020 uto kazuori. All rights reserved.
//

import UIKit

class SideMenuVC: UIViewController {
    
    @IBOutlet weak var backupBtn: UIButton!
    @IBOutlet weak var restoreBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        uiConfig()
    }
    
    private func uiConfig() {
        backupBtn.layer.cornerRadius = backupBtn.frame.height / 2
        restoreBtn.layer.cornerRadius = restoreBtn.frame.height / 2
    }

}
