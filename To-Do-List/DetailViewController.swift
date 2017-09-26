//
//  DetailViewController.swift
//  To-Do-List
//
//  Created by Teddy Burns on 9/25/17.
//  Copyright © 2017 Teddy Burns. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var toDoField: UITextField!
    var toDoItem: String?
    var toDoNotes: String?
    @IBOutlet weak var saveBarButton: UIBarButtonItem!
    @IBOutlet weak var toDoNotesField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let toDoItem = toDoItem{
            toDoField.text = toDoItem
            enableDisableSavebutton()
            self.navigationItem.title = "Edit To Do Item"
        } else {
            self.navigationItem.title = "New To Do Item"
        }
        if let toDoNotes = toDoNotes {
            toDoNotesField.text = toDoNotes
        }
        
        toDoField.becomeFirstResponder()

    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "UnwindFromSave" {
            toDoItem = toDoField.text
            toDoNotes = toDoNotesField.text
        }
    }
    @IBAction func cancelPressed(_ sender: UIBarButtonItem) {
        let isPresentingInAddMode = presentingViewController is UINavigationController
        if isPresentingInAddMode {
            dismiss(animated: true, completion: nil)
        } else {
            navigationController?.popViewController(animated: true)
        }
    }
    @IBAction func doneButtonPressed(_ sender: UITextField) {
        toDoField.resignFirstResponder()
    }
    @IBAction func toDoFieldChanged(_ sender: UITextField) {
        enableDisableSavebutton()
    }
    
    func enableDisableSavebutton() {
        if let toDoLength = toDoField.text?.count, toDoLength > 0 { // Called short-circuiting
            saveBarButton.isEnabled = true
        } else {
            saveBarButton.isEnabled = false
        }
    }
}
