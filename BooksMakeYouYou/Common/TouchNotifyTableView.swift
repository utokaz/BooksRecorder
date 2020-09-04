//
//  TouchNotifyTableView.swift
//  BooksMakeYouYou
//
//  Created by uto kazuori on 2020/08/23.
//  Copyright © 2020 uto kazuori. All rights reserved.
//

import UIKit

class TouchNotifyTableView: UITableView {
    weak var touchNotifyDelegate: TouchNofifyTableViewDelegate!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        touchNotifyDelegate.tableTouched(self)
    }
}

protocol TouchNofifyTableViewDelegate: class {
    func tableTouched(_ touchTableView: TouchNotifyTableView)
}
