//
//  ViewController.swift
//  Project5
//
//  Created by winster jose on 26/08/16.
//  Copyright © 2016 amadeus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var dummy : UIView?
    
    var animator : UIDynamicAnimator?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        dummy = UIView(frame: CGRectMake(50,50,100,100))
        dummy!.backgroundColor = UIColor.blueColor()
        dummy!.layer.cornerRadius = 50.0
        dummy!.clipsToBounds = true
        self.view.addSubview(dummy!)
        
        animator = UIDynamicAnimator(referenceView: self.view)
        let gravity = UIGravityBehavior(items: [dummy!])
        gravity.gravityDirection = CGVectorMake(0, 1)
        
        animator?.addBehavior(gravity)
        
        let collission = UICollisionBehavior(items: [dummy!])
        collission.addBoundaryWithIdentifier("collision", fromPoint: CGPointMake(0.0, 400.0), toPoint: CGPointMake(320.0, 480.0))
        
        animator?.addBehavior(collission)
        
        let pushBehavior = UIPushBehavior(items: [dummy!], mode: UIPushBehaviorMode.Instantaneous)
        pushBehavior.magnitude = 10.0
        //pushBehavior.pushDirection = CGVectorMake(0, 1)
        animator!.addBehavior(pushBehavior)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

