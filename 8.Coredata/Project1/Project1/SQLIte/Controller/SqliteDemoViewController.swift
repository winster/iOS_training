//
//  SqliteDemoViewController.swift
//  Project1
//
//  Created by winster jose on 25/08/16.
//  Copyright © 2016 amadeus. All rights reserved.
//

import UIKit

class SqliteDemoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var persons : [PersonModel]?
    var tableOfPersons : UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.whiteColor()
        self.edgesForExtendedLayout = UIRectEdge.None
        
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: #selector(SqliteDemoViewController.addPersonScreen))
        
        //let db = PersonDBModel.sharedInstance()
        //db.insertIntoPerson(pid: 1, pname: "Winster")
        //db.insertIntoPerson(pid: 2, pname: "Jose")
        //db.updatePersonWith(pid: 1, pname: "Amadeus")
        //db.deletePersonWith(pid: 2)
        //persons = db.selectAllFromPerson()
        //print("number of persons\(persons?.count)")
        
        //for (_, person) in persons!.enumerate() {
        //    print("pid is \(person.pid!):: name is \(person.pname!)")
        //}
        /*for i in 0..<persons!.count {
           let person = persons![i]
           print("pid is \(person.pid!):: name is \(person.pname!)")
        }*/
        /*tableOfPersons = UITableView(frame: CGRectMake(10, 10, 300, 400))
        tableOfPersons!.delegate = self
        tableOfPersons!.dataSource = self
        self.view.addSubview(tableOfPersons!)*/
    
    }
    
    override func viewWillAppear(animated: Bool) {
        if persons != nil {
            persons = nil
        }
        
        let db = PersonDBModel.sharedInstance()
        persons = db.selectAllFromPerson()
        
        if(tableOfPersons == nil) {
            tableOfPersons = UITableView(frame: CGRectMake(10, 10, 300, 400))
            tableOfPersons!.delegate = self
            tableOfPersons!.dataSource = self
            self.view.addSubview(tableOfPersons!)
        } else {
            tableOfPersons!.reloadData()
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell : UITableViewCell?
        cell = tableOfPersons!.dequeueReusableCellWithIdentifier("persons")
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "person")
        }
        let person = persons![indexPath.row]
        cell!.textLabel!.text = person.pname
        cell!.detailTextLabel!.text = "\(person.pid!)"
        return cell!
    }
    
    func addPersonScreen(){
        print("addPersonScreen")
        let addPerson = AddPersonsViewController()
        self.navigationController?.pushViewController(addPerson, animated: true)
        
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
