//
//  AddToDoViewController.swift
//  ToDo List
//
//  Created by Ryan Miller on 4/11/18.
//  Copyright © 2018 Ryan Miller. All rights reserved.
//

import UIKit

class AddToDoViewController: UIViewController {

    var previousVC = ToDoTableViewController()
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var importantSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func addTapped(_ sender: Any) {
        
        /*
        let toDo = ToDo()
        if let toDoNameUnwrapped = titleTextField.text {
            toDo.name = toDoNameUnwrapped
            toDo.important = importantSwitch.isOn
            
            previousVC.toDos.append(toDo)
            previousVC.tableView.reloadData()
            
            navigationController?.popViewController(animated: true)
        }
        */
        
        //code to work with core data by accessing "context" (bridge b/t app and core data)
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            
            let toDo = ToDoCoreData(entity: ToDoCoreData.entity(), insertInto: context)
            if let toDoNameUnwrapped = titleTextField.text {
                toDo.name = toDoNameUnwrapped
                toDo.important = importantSwitch.isOn
            }
            //update context to reflect changes
            try? context.save()
            
            navigationController?.popViewController(animated: true)
        }
        
    }
}
