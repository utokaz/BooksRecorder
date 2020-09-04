//
//  SearchVCTableViewCell.swift
//  BooksMakeYouYou
//
//  Created by uto kazuori on 2020/08/22.
//  Copyright © 2020 uto kazuori. All rights reserved.
//

import UIKit
import Kingfisher

class SearchVCTableViewCell: UITableViewCell {
    @IBOutlet weak var bookImageView: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var autor: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func config(imageURL: URL?, title: String?, author: String?) {
        self.bookImageView.kf.indicatorType = .activity
        self.bookImageView.kf.setImage(with: imageURL)
        self.title.text = title
        self.autor.text = author
    }
    
    func config(image: UIImage?, title: String?, author: String?) {
        self.bookImageView.image = image
        self.title.text = title
        self.autor.text = author
    }
    
}

extension UITableViewCell {

    @IBInspectable
    var selectedBackgroundColor: UIColor? {
        get {
            return selectedBackgroundView?.backgroundColor
        }
        set(color) {
            let background = UIView()
            background.backgroundColor = color
            selectedBackgroundView = background
        }
    }

}
