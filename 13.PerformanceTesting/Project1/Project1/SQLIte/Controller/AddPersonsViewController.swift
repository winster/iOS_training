//
//  AddPersonsViewController.swift
//  Project1
//
//  Created by winster jose on 25/08/16.
//  Copyright © 2016 amadeus. All rights reserved.
//

import UIKit

class AddPersonsViewController: UIViewController {

    var idTextField : UITextField?
    var nameTextField : UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.whiteColor()
        self.edgesForExtendedLayout = UIRectEdge.None
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Save, target: self, action: #selector(AddPersonsViewController.savePerson))
        
        idTextField = UITextField(frame: CGRectMake(10,10,300,40))
        idTextField!.text = ""
        idTextField!.placeholder = "Enter Id"
        idTextField!.borderStyle = UITextBorderStyle.RoundedRect
        self.view.addSubview(idTextField!)
        
        nameTextField = UITextField(frame: CGRectMake(10,60,300,40))
        nameTextField!.text = ""
        nameTextField!.placeholder = "Enter Name"
        nameTextField!.borderStyle = UITextBorderStyle.RoundedRect
        self.view.addSubview(nameTextField!)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func savePerson(){
        print("savePerson")
        var errorMessage = ""
        var isError = false
        if idTextField!.text!.isEmpty {
            errorMessage = "ID cannot be blank!"
            isError = true
        }
        if nameTextField!.text!.isEmpty {
            errorMessage = "Name cannot be blank!"
            isError = true
        }
        if isError {
            let alert = UIAlertView(title: "Error", message: errorMessage, delegate: self, cancelButtonTitle: "OK")
            alert.show()
        } else {
            let pid = Int(idTextField!.text!)
            let pname = nameTextField!.text
            let db = PersonDBModel.sharedInstance()
            db.insertIntoPerson(pid: pid!, pname: pname!)
            self.navigationController?.popViewControllerAnimated(true)
        }
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
