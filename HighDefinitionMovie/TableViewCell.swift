//
//  TableViewCell.swift
//  HighDefinitionMovie
//
//  Created by 张齐朴 on 16/1/18.
//  Copyright © 2016年 张齐朴. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var collectionCellId: String = ""
    var imageSoures: Array<AnyObject> = []

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageSoures.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let collectionCell = collectionView.dequeueReusableCellWithReuseIdentifier(
            collectionCellId, forIndexPath: indexPath)
        
        if (imageSoures.count > 0) {
            (collectionCell as! CollectionViewCell).model = imageSoures[indexPath.row]
            (collectionCell as! CollectionViewCell).configContent()
        }
        
        return collectionCell
    }
    
}
