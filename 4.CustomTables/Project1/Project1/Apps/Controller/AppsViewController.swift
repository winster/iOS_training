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
    var apps : [AppModel]?
    
    func loadTableOfApps(){
        
        let provider = AppProvider()
        apps = provider.getApps()
        
        var height : CGFloat = 0.0
        if (Float(apps!.count) * 80.0) > 400.0 {
            height = 400.0
        } else {
            height = CGFloat(Float(apps!.count) * 80.0)
        }
        
        tableOfApps = UITableView(frame: CGRectMake(10, 10, 300, height))
        tableOfApps!.delegate = self
        tableOfApps!.dataSource = self
        self.view.addSubview(tableOfApps!)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return apps!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        var cell : AppTableViewCell?
        
        cell = tableOfApps!.dequeueReusableCellWithIdentifier("apps") as? AppTableViewCell
        
        if cell == nil {
            cell = AppTableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "apps")
        }
        
        let app = apps![indexPath.row]
        cell!.iconImageView!.image = app.icon
        cell!.nameLabel!.text = app.name
        cell!.publisherNameLabel!.text = app.publisherName
        
        return cell!
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        return 80.0
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
