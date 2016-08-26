//
//  ViewController.swift
//  Project3
//
//  Created by winster jose on 25/08/16.
//  Copyright © 2016 amadeus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var label1 : UILabel?
    var label2 : UILabel?
    var label3 : UILabel?

    var viewDictionary : [String:AnyObject]?
    var metricDictionary : [String:AnyObject]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        label1 = UILabel()
        label1!.backgroundColor = UIColor.redColor()
        label1!.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(label1!)

        label2 = UILabel()
        label2!.backgroundColor = UIColor.blueColor()
        label2!.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(label2!)

        label3 = UILabel()
        label3!.backgroundColor = UIColor.greenColor()
        label3!.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(label3!)
        
        viewDictionary = [:]
        viewDictionary!["label1"] = label1!
        viewDictionary!["label2"] = label2!
        viewDictionary!["label3"] = label3!
        
        metricDictionary = [:]
        
        var spacing : Float = 0.0
        var height : Float = 0.0
        
        if UI_USER_INTERFACE_IDIOM() == .Pad {
            spacing = 20.0
            height = 80.0
        } else {
            spacing = 10.0
            height = 40.0
        }
        metricDictionary!["spacing"] = spacing
        metricDictionary!["height"] = height
        
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("|-spacing-[label1]-spacing-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: metricDictionary!, views: viewDictionary!))
        
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("|-spacing-[label2]-spacing-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: metricDictionary!, views: viewDictionary!))
        
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("|-spacing-[label3]-spacing-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: metricDictionary!, views: viewDictionary!))
        
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[label1(height)]-spacing-[label2(height)]-spacing-[label3(height)]-spacing-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: metricDictionary!, views: viewDictionary!))
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

