//
//  HomePageViewController.swift
//  HighDefinitionMovie
//
//  Created by 张齐朴 on 15/12/26.
//  Copyright © 2015年 张齐朴. All rights reserved.
//

import UIKit

private let rankCellHeight: Float             = 244.0
private let bannerCellHeight: Float           = 170.0
private let specialCellHeight: Float          = 99.0
private let videoInfoCellHeight: Float        = 264.0
private let rankDetailCellHeight: Float       = 44.0

class HomePageViewController:
    UIViewController,
    UITableViewDataSource,
    UITableViewDelegate
{
    let cellIds: NSArray = [
        "TableViewCellBanner",
        "TableViewCellVideoInfo",
        "TableViewCellSpecial",
        "TableViewCellVideoInfo",
        "TableViewCellVideoInfo",
        "TableViewCellRank",
        "TableViewCellVideoInfo",
        "TableViewCellSpecial",
        "TableViewCellVideoInfo",
        "TableViewCellVideoInfo",
        "TableViewCellVideoInfo",
        "TableViewCellSpecial",
        "TableViewCellVideoInfo",
        "TableViewCellVideoInfo",
        "TableViewCellSpecial",
        "TableViewCellVideoInfo",
        "TableViewCellVideoInfo",
        "TableViewCellVideoInfo"
    ]
    
    let collectionCellIds: NSArray = [
        "CollectionViewCellBanner",
        "CollectionViewCellVideoInfo",
        "CollectionViewCellSpecial",
        "CollectionViewCellVideoInfo",
        "CollectionViewCellVideoInfo",
        "CollectionViewCellRank",
        "CollectionViewCellVideoInfo",
        "CollectionViewCellSpecial",
        "CollectionViewCellVideoInfo",
        "CollectionViewCellVideoInfo",
        "CollectionViewCellVideoInfo",
        "CollectionViewCellSpecial",
        "CollectionViewCellVideoInfo",
        "CollectionViewCellVideoInfo",
        "CollectionViewCellSpecial",
        "CollectionViewCellVideoInfo",
        "CollectionViewCellVideoInfo",
        "CollectionViewCellVideoInfo"
    ]
    
    let cellHeights: NSArray = [
        bannerCellHeight,
        videoInfoCellHeight,
        specialCellHeight,
        videoInfoCellHeight,
        videoInfoCellHeight,
        rankCellHeight,
        videoInfoCellHeight,
        specialCellHeight,
        videoInfoCellHeight,
        videoInfoCellHeight,
        videoInfoCellHeight,
        specialCellHeight,
        videoInfoCellHeight,
        videoInfoCellHeight,
        specialCellHeight,
        videoInfoCellHeight,
        videoInfoCellHeight,
        videoInfoCellHeight
    ]
    
    @IBOutlet weak var tableView: UITableView!
    
    var imageSources: NSMutableArray = []
    var xmlDataParser: XmlDataParser?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view .
        let historyButton           = UIButton(frame: CGRectMake(0, 0, 20, 20))
        let historyButtonItem       = UIBarButtonItem(customView: historyButton)
        let storeButton             = UIButton(frame: CGRectMake(0, 0, 20, 20))
        let storeButtonItem         = UIBarButtonItem(customView: storeButton)
        let rightButtonItems: Array = [historyButtonItem, storeButtonItem]

        historyButton.setImage(UIImage.init(named: "time~iphone"), forState: .Normal)
        storeButton.setImage(UIImage.init(named: "store~iphone"), forState: .Normal)
    
        historyButton.addTarget(self, action: "historyButtonAction", forControlEvents: .TouchUpInside)
        
        parentViewController?.navigationItem.rightBarButtonItems = rightButtonItems
        
        xmlDataParser = XmlDataParser.init()
        
        requestHtml()
    }
    
    func historyButtonAction() {
        UIApplication.sharedApplication().openURL(NSURL.init(string: "baoluo.demo://")!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func requestHtml() {
        let request = NSMutableURLRequest.init(URL: NSURL.init(
            string: Interface.HomeAPI)!)
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) {
            (response, data, error) -> Void in
            
            let xmlString: String = String(data: data!, encoding: NSUTF8StringEncoding)!
            print(xmlString)
            
            let bannerInfo        = self.xmlDataParser?.parseBanaerInfo(data!)
            let scrollerInfo      = self.xmlDataParser?.parseScrollerInfo(data!)
            let specialInfo       = self.xmlDataParser?.parseSpecialInfo(data!)
            let rankInfo          = self.xmlDataParser?.parseRankInfo(data!)
            
            self.imageSources.addObject(bannerInfo!)
            self.imageSources.addObjectsFromArray(scrollerInfo!)
            self.imageSources.insertObject(specialInfo![0], atIndex: 2)
            self.imageSources.insertObject(rankInfo!, atIndex: 5)
            self.imageSources.insertObject(specialInfo![1], atIndex: 7)
            self.imageSources.insertObject(specialInfo![2], atIndex: 11)
            self.imageSources.insertObject(specialInfo![3], atIndex: 14)
            
            self.tableView.reloadData()
        }
        
    }

    // MARK: - TableViewDelegate
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellIds.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIds[indexPath.row] as! String)
        
        if (indexPath.row > 0) {
            (cell as! TableViewCell).collectionCellId = collectionCellIds[indexPath.row] as! String
            
            if (imageSources.count > 0) {
                if (indexPath.row == 5) {
                    (cell as! TableViewCell).imageSoures = self.imageSources[indexPath.row]
                        as! Array<Array<Dictionary<String, String>>>
                    (cell as! TableViewCell).collectionView.reloadData()

                } else {
                    (cell as! TableViewCell).imageSoures = self.imageSources[indexPath.row]
                        as! Array<Dictionary<String, String>>
                    (cell as! TableViewCell).collectionView.reloadData()
                }
            }
        } else {
            if (imageSources.count > 0) {
                (cell as! BannerTableViewCell).imageSoures = self.imageSources[0]
                    as! Array<Dictionary<String, String>>
                (cell as! BannerTableViewCell).configImages()
            }
        }
        
        return cell!
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return CGFloat(cellHeights[indexPath.row] as! NSNumber)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
