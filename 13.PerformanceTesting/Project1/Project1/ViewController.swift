//
//  ViewController.swift
//  Project1
//
//  Created by winster jose on 24/08/16.
//  Copyright © 2016 amadeus. All rights reserved.
//

import UIKit

//UILabel ----- String

class ViewController: UIViewController {
    
    var nameLabel : UILabel?
    
    func loadNameLabel(){
        //step 1 : create model
        let name = "Winster Jose"
        //step 2: create view
        // step 2.1: create the view and initialize it frame
        nameLabel = UILabel(frame: CGRectMake(10, 10, 300, 40))
        //step 2.2: associate model with view
        nameLabel!.text = name //model meets view in controller
        //step 2.3: Optional properties
        nameLabel!.textColor = UIColor.whiteColor()
        nameLabel!.font = UIFont.boldSystemFontOfSize(20.0)
        nameLabel!.textAlignment = NSTextAlignment.Center
        
        //step 2.4: Adding to parent view
        self.view.addSubview(nameLabel!)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.blueColor()
        self.edgesForExtendedLayout = UIRectEdge.None
    }
    
    override func viewWillAppear(animated: Bool) {
        if nameLabel == nil {
            loadNameLabel()
        }
    }

    override func viewDidDisappear(animated: Bool) {
        if nameLabel != nil {
            nameLabel!.removeFromSuperview()
            nameLabel = nil
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

