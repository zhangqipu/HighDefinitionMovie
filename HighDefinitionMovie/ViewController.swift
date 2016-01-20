//
//  ViewController.swift
//  HighDefinitionMovie
//
//  Created by 张齐朴 on 15/12/26.
//  Copyright © 2015年 张齐朴. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    internal var className : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setNavStyle()
        
        let storyboard = UIStoryboard.init(name: self.className!, bundle: NSBundle.mainBundle())
        let viewController  = storyboard.instantiateViewControllerWithIdentifier(self.className!)
        
        addChildViewController(viewController)
        view.addSubview(viewController.view)
    }

    internal func setNavStyle () {
        NSForegroundColorAttributeName
        navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
