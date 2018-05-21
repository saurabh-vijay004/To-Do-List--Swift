//
//  SecondViewController.swift
//  To Do List- Swift
//
//  Created by Saurabh on 5/21/18.
//  Copyright © 2018 Saurabh. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var itemTextField: UITextField!

    
    @IBAction func addItem(_ sender: UIButton) {
        
        print(itemTextField.text ?? "nil")
        
        if !((itemTextField.text?.isEmpty ?? true ))! {
            
            let taskObject = UserDefaults.standard.object(forKey: "tasks");
            
            var task:[String]
            
            if let tempTask = taskObject as? [String] {
                print(tempTask)
                
                task = tempTask
                
                task.append(itemTextField.text!)
                
            } else {
                
                task = [itemTextField.text!]
            
            }
            
            
            UserDefaults.standard.set(task, forKey: "tasks");
        
//            print(task)
            itemTextField.text = "";
            
        } else {
            
            let alert = UIAlertController(title: "Alert", message: "Enter Task to Add", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }
 
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

        self.view.endEditing(true);

    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
        
    }

}

