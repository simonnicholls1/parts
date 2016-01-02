//
//  ViewController.swift
//  parts
//
//  Created by Simon on 01/01/2016.
//  Copyright (c) 2016 Simon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var scrollview: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let V1 :View1 = View1(nibName: "View1", bundle: nil)
        self.addChildViewController(V1)
        self.scrollview.addSubview(V1.view)
        
        V1.didMoveToParentViewController(self)
        
        
        let V2 :View2 = View2(nibName: "View2", bundle: nil)
        self.addChildViewController(V2)
        self.scrollview.addSubview(V2.view)
        
        V2.didMoveToParentViewController(self)
        
        var V2Frame : CGRect = V2.view.frame
        V2Frame.origin.x = self.view.frame.width
        V2.view.frame = V2Frame
        
        self.scrollview.contentSize = CGSizeMake(self.view.frame.width*2, self.view.frame.size.height)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

