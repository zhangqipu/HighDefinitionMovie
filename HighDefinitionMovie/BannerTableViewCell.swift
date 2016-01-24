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
            let tap               = UITapGestureRecognizer.init(target: self, action: "imageTap:")
            let imgv: UIImageView = UIImageView.init(frame: CGRectZero)
            imgv.userInteractionEnabled = true
            imgv.tag = i
            imgv.addGestureRecognizer(tap)
            
            scrollView.addSubview(imgv)
            imageViews.addObject(imgv)
        }
        
        scrollView.contentSize = CGSizeMake(5 * CGRectGetWidth(self.frame), 0)
    }

    func imageTap(tap: UITapGestureRecognizer) {
        let m: Dictionary<String, String> = imageSoures[(tap.view?.tag)!]
        let ID = m["id"]!
        let title = m["title"]!.stringByAddingPercentEncodingWithAllowedCharacters(
            NSCharacterSet.URLQueryAllowedCharacterSet())
        let request = NSMutableURLRequest.init(URL: NSURL.init(
            string: Interface.DetailAPI + "?video_id=" + ID + "&video_name=" + title!)!)
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) {
            (response, data, error) -> Void in
            let s: String = String(data: data!, encoding: NSUTF8StringEncoding)!
            print(s)

        }
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

        var i:Int = 0
        for imgv in imageViews {
            (imgv as! UIImageView).frame = CGRectMake(
                CGRectGetWidth(self.bounds) * CGFloat(i),
                CGRectGetMinY(self.bounds),
                CGRectGetWidth(self.bounds),
                CGRectGetHeight(self.bounds))
            
            i++
        }
        
    }
    
}
