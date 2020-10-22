//
//  BaseVC.swift
//  BooksMakeYouYou
//
//  Created by uto kazuori on 2020/10/16.
//  Copyright © 2020 uto kazuori. All rights reserved.
//

import UIKit

class BaseVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("displaying vc is \(String(describing:type(of: self)))")
    }
    
    func showDialog(title: String?, message: String?, okAction: (() -> Void)? = nil, cancellAction: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: { action in (okAction ?? {})() })
        let cancellAction = UIAlertAction(title: "cancell", style: .cancel, handler: { action in (cancellAction ?? {})() })
        alert.addAction(okAction)
        alert.addAction(cancellAction)
        present(alert, animated: true, completion: nil)
    }
    
    func showDialog(title: String?, message: String?, okAction: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: { action in (okAction ?? {})() })
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
}
