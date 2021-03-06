//
//  VideoCollectionViewCell.swift
//  HighDefinitionMovie
//
//  Created by 张齐朴 on 16/1/20.
//  Copyright © 2016年 张齐朴. All rights reserved.
//

import UIKit

class VideoCollectionViewCell: CollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detaiLabel: UILabel!
    
    override func configContent() {
        super.configContent()
        
        let m: Dictionary<String, String> = model as! Dictionary
        
        imageView.kf_setImageWithURL(NSURL.init(string: m["url"]!)!)
        titleLabel.text = m["title"]
        detaiLabel.text = m["info"]
    }

}
