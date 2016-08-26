//
//  AppsViewController.swift
//  Project1
//
//  Created by winster jose on 24/08/16.
//  Copyright © 2016 amadeus. All rights reserved.
//

//UITableView <---------- Array
import UIKit

class AppsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableOfApps : UITableView?
    
    func loadTableOfApps(){
        tableOfApps = UITableView(frame: CGRectMake(10, 10, 300, 400))
        tableOfApps!.delegate = self
        tableOfApps!.dataSource = self
        self.view.addSubview(tableOfApps!)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 20
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        var cell : UITableViewCell?
        
        cell = tableOfApps!.dequeueReusableCellWithIdentifier("apps")
        
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "apps")
        }
        
        cell!.textLabel!.text = "Row \(indexPath.row)"
        //cell!.imageView?.image = nil
        
        return cell!
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.redColor()
        loadTableOfApps()
        
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
