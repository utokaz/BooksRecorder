//
//  BookCollectionViewCell.swift
//  BooksMakeYouYou
//
//  Created by uto kazuori on 2020/09/02.
//  Copyright © 2020 uto kazuori. All rights reserved.
//

import UIKit

class BookCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var bookImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func config(title: String?, author: String?, bookImageUrl: String?) {
            self.title.text = title
            self.author.text = author
        if let urlStr = bookImageUrl, let url = URL(string: urlStr) {
            self.bookImageView.kf.indicatorType = .activity
            self.bookImageView.kf.setImage(with: url)
        } else {
            self.bookImageView.image = UIImage(named: "noimage")
        }
    }
}
