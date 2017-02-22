//
//  AddTaskViewController.swift
//  coreToDoApp
//
//  Created by Vinoth Sridharan on 2/19/17.
//  Copyright © 2017 Vinoth Sridharan. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController {

    @IBOutlet var textField: UITextField!
    
    @IBOutlet var isImp: UISwitch!
    
    @IBOutlet var detilsText: UITextField!
    
       
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

   
    @IBAction func btnTapped(_ sender: UIButton) {
        
   let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        
        let task = Task(context: context)
        task.name = textField.text!
        task.isimportant = isImp.isOn
        
        //save the data to coredata
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController!.popViewController(animated :true)
        
        
    }
    
}
