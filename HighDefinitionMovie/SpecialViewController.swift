//
//  SpecialViewController.swift
//  HighDefinitionMovie
//
//  Created by 张齐朴 on 16/1/24.
//  Copyright © 2016年 张齐朴. All rights reserved.
//

import UIKit

class SpecialViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var webView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        let request = NSURLRequest.init(URL: NSURL.init(string: Interface.SpecialAPI)!)
//        
//        self.webView.loadRequest(request)
        let HTMLPath   = NSBundle.mainBundle().pathForResource("special", ofType: "html")
        let HTMLString = try! String.init(contentsOfFile: HTMLPath!, encoding: NSUTF8StringEncoding)
        self.webView.loadHTMLString(HTMLString, baseURL: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        self.webView.hidden = false
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
