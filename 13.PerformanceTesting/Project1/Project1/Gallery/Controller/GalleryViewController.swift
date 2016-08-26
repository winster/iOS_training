//
//  GalleryViewController.swift
//  Project1
//
//  Created by winster jose on 24/08/16.
//  Copyright © 2016 amadeus. All rights reserved.
//

import UIKit

class GalleryViewController: UIViewController {

    var iconImageView : UIImageView?
    
    func loadIconImageView(){
        iconImageView = UIImageView(image: UIImage(named: "gallery"))//step 1 & 2 are done
        iconImageView!.center = CGPointMake(200, 300)
        self.view.addSubview(iconImageView!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.brownColor()
        self.edgesForExtendedLayout = UIRectEdge.None
        loadIconImageView()
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
