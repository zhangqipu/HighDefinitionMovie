//
//  SpecialCollectionViewCell.swift
//  HighDefinitionMovie
//
//  Created by 张齐朴 on 16/1/20.
//  Copyright © 2016年 张齐朴. All rights reserved.
//

import UIKit

class SpecialCollectionViewCell: CollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func configContent() {
        imageView.kf_setImageWithURL(NSURL.init(string: (model as! Dictionary)["url"]!)!)
    }
}
