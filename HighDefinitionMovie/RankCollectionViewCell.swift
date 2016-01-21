//
//  RankCollectionViewCell.swift
//  HighDefinitionMovie
//
//  Created by 张齐朴 on 16/1/20.
//  Copyright © 2016年 张齐朴. All rights reserved.
//

import UIKit

private let TableViewCellRankDetail: String   = "TableViewCellRankDetail"

class RankCollectionViewCell: CollectionViewCell, UITableViewDataSource, UITableViewDelegate {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let arr: Array<Dictionary<String, String>> = (model as! Array)
        return arr.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(TableViewCellRankDetail)
        
        (cell as! RankTableViewCellDetail).model = (model as! Array<Dictionary<String, String>>)[indexPath.row]
        (cell as! RankTableViewCellDetail).configContent()
        
        return cell!
    }
}
