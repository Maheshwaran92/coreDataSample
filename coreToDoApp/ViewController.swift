//
//  ViewController.swift
//  coreToDoApp
//
//  Created by Vinoth Sridharan on 2/19/17.
//  Copyright © 2017 Vinoth Sridharan. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var tableView: UITableView!
    

    var tasks: [Task] = []

 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // get data from core data
        getData()
        
        // reload the tableview
        
        tableView.reloadData()
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return tasks.count
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        //let cell =  UITableViewCell()
        let cell :UITableViewCell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "Cell")


                let task = tasks[indexPath.row]
        if task.isimportant {
            cell.textLabel?.text = "😰\(task.name!)"
        }else{
         cell.textLabel?.text = task.name!
        }
        
        return cell
        
        
    }
    
    func getData()  {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do{
            tasks = try context.fetch( Task.fetchRequest())
            print(tasks)
        }catch{
            print("fetching failed")
        }
        
        
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        if editingStyle == .delete{
            let task = tasks[indexPath.row]
            context.delete(task)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            do{
                tasks = try context.fetch( Task.fetchRequest())
            }catch{
                print("fetching failed")
            }

            
        }
        tableView.reloadData()
    }
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        
        return 124.0
    }
    


}

