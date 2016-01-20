//
//  BannerTableViewCell.swift
//  HighDefinitionMovie
//
//  Created by 张齐朴 on 16/1/18.
//  Copyright © 2016年 张齐朴. All rights reserved.
//

import UIKit

class BannerTableViewCell: UITableViewCell {

    @IBOutlet weak var scrollView: UIScrollView!
    
    var imageViews: NSMutableArray = []
    var imageSoures: Array<Dictionary<String, String>> = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        for var i = 0; i < 5; i++ {
            let imgv: UIImageView = UIImageView.init(frame: CGRectMake(
                CGRectGetWidth(self.frame) * CGFloat(i),
                CGRectGetMinY(self.frame),
                CGRectGetWidth(self.frame),
                CGRectGetHeight(self.frame)))
            
            scrollView.addSubview(imgv)
            imageViews.addObject(imgv)
        }
        
        scrollView.contentSize = CGSizeMake(5 * CGRectGetWidth(self.frame), 0)
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configImages() {
        
        if ((imageSoures.count > 0) == false) { return }
        
        for var i = 0; i < 5; ++i {
            let imgv:UIImageView = imageViews[i] as! UIImageView
            let url:String       = imageSoures[i]["url"]!
            
            imgv.kf_setImageWithURL(NSURL.init(string: url)!)
        }
    }

    override func layoutSubviews() {
        scrollView.contentSize = CGSizeMake(5 * CGRectGetWidth(self.frame), CGRectGetHeight(scrollView.frame))

        self.contentView.translatesAutoresizingMaskIntoConstraints = false

        var i:Int = 0
        for imgv in imageViews {
            (imgv as! UIImageView).frame = CGRectMake(
                CGRectGetWidth(imgv.frame) * CGFloat(i),
                CGRectGetMinY(imgv.frame),
                CGRectGetWidth(imgv.frame),
                CGRectGetHeight(imgv.frame))
            
            i++
        }
        
    }
    
}
