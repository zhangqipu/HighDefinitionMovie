//
//  XmlDataParser.swift
//  HighDefinitionMovie
//
//  Created by 张齐朴 on 16/1/18.
//  Copyright © 2016年 张齐朴. All rights reserved.
//

import UIKit

class XmlDataParser: NSObject {

    func parseBanaerInfo(xmlData: NSData) -> Array<Dictionary<String, String>> {
        let hpple                     = TFHpple.init(HTMLData: xmlData)
        let scrollerItems: NSArray    = hpple.searchWithXPathQuery("//div[@id='scroller']")
        let scrollerChildren: NSArray = scrollerItems[0].children
        
        var bannerArr: Array<Dictionary<String, String>> = Array()
        for e in scrollerChildren {
            let e1 = e as! TFHppleElement
            if (e1.raw != nil) {
                let attbutes: Dictionary = e1.attributes
                let title: String        = String(attbutes["data-name"])
                var url: String          = String(attbutes["style"])
                let ID: String           = String(attbutes["data-id"])
                let startIdx             = url.startIndex.advancedBy(30)
                let endIdx               = url.endIndex.advancedBy(-2)
                let range                = Range<String.Index>(start: startIdx, end: endIdx)
                
                url = url.substringWithRange(range)
                let bannerDic: Dictionary = ["title": title, "url": url, "id": ID]
                
                bannerArr.append(bannerDic)
            }
        }

        return bannerArr
    }
    
    func parseScrollerInfo(xmlData: NSData) -> Array<Array<Dictionary<String, String>>> {
        let hpple                     = TFHpple.init(HTMLData: xmlData)
        let cateLists:NSArray         = hpple.searchWithXPathQuery("//div[@class='cate-list']")
        
        var cateArray:Array<Array<Dictionary<String, String>>>  = Array()
        
        for var i = 0; i < cateLists.count; ++i {
            let scrollerItems: NSArray    = cateLists[i].searchWithXPathQuery(
                "//div[@class='scroller clearfix']")
            let scrollerChildren: NSArray = scrollerItems[0].children

            var scrollerInfoArray: Array<Dictionary<String, String>> = Array()
            for e in scrollerChildren {
                let e1 = (e as! TFHppleElement)
                
                if (e1.hasChildren()) {
                    
                    let title: String           = e1.firstChildWithClassName("title").content
                    let info: String            = e1.firstChildWithClassName("info").content
                    let score: String           = e1.firstChildWithClassName("score").content
                    let imgInfo: TFHppleElement = e1.firstChildWithClassName("lazy-pic")
                    let url: String             = imgInfo.objectForKey("data-pic")
                    
                    let dic: Dictionary         = [
                        "title":title,
                        "info":info,
                        "score":score,
                        "url":url
                    ]
                    
                    scrollerInfoArray.append(dic)
                }
            }

            cateArray.append(scrollerInfoArray)
        }
        
        return cateArray
    }
    
    func parseSpecialInfo(xmlData: NSData) -> Array<Array<Dictionary<String, String>>> {
        let hpple             = TFHpple.init(HTMLData: xmlData)
        let cateLists:NSArray = hpple.searchWithXPathQuery("//div[@class='cate-list special-list']")
        
        var cateArray:Array<Array<Dictionary<String, String>>>  = Array()

        for var i = 0; i < cateLists.count; i++ {
            let alinkInfoArray:NSArray = cateLists[i].searchWithXPathQuery("//a[@data-id]")
            var specialInfoArray: Array<Dictionary<String, String>> = Array()

            for e in alinkInfoArray {
                
                let child:TFHppleElement = (e as! TFHppleElement).children[0] as! TFHppleElement
                
                if ((child.objectForKey("data-pic")) != nil) {
                    let title:String   = child.parent.objectForKey("data-name")
                    let url:String     = child.objectForKey("data-pic")
                    
                    let dic:Dictionary = [
                        "title":title,
                        "url":url
                    ]
                    
                    specialInfoArray.append(dic)
                }
            }
            
            cateArray.append(specialInfoArray)
        }
        
        return cateArray
    }
    
    func parseRankInfo(xmlData: NSData) -> Array<Array<Dictionary<String, String>>> {
        let hpple                     = TFHpple.init(HTMLData: xmlData)
        let cateLists:NSArray         = hpple.searchWithXPathQuery("//div[@class='cate-list chart-list']")
        let scrollerItems: NSArray    = cateLists[0].searchWithXPathQuery("//div[@class='video-item-con']")
        
        var rankArray:Array<Array<Dictionary<String, String>>>  = Array()

        for item in scrollerItems {
            let child:NSArray = item.children
            var rankInfoArray: Array<Dictionary<String, String>> = Array()

            for sitem in child {
                if (sitem.hasChildren()) {
                    let title:String   = sitem.objectForKey("data-name")
                    let url:String     = sitem.objectForKey("data-cover")
                    let score:String   = sitem.objectForKey("data-score")
            
                    let dic:Dictionary = [
                        "title":title,
                        "url":url,
                        "score":score
                    ]

                    rankInfoArray.append(dic)
                }
            }
            
            rankArray.append(rankInfoArray)
        }
        
        return rankArray
    }

}
