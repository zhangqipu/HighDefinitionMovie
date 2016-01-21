//
//  RankTableViewCellDetail.swift
//  HighDefinitionMovie
//
//  Created by 张齐朴 on 16/1/20.
//  Copyright © 2016年 张齐朴. All rights reserved.
//

import UIKit

class RankTableViewCellDetail: UITableViewCell {

    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!

    var model: Dictionary<String, String>?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configContent() {
        
        let m: Dictionary<String, String> = model!
        
        imageView1.kf_setImageWithURL(NSURL.init(string: m["url"]!)!)
        titleLabel.text = m["title"]
        scoreLabel.text = m["score"]
    }
}
