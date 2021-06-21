//
//  addItem.swift
//  contactList
//
//  Created by Michal L on 13.04.2021.
//  Copyright © 2021 Michal L. All rights reserved.
//

import UIKit

class addItem: UIViewController {

    weak var delegate: addItemDelegate?

    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var phoneField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        title="New Contact"
        navigationController?.navigationBar.prefersLargeTitles=true
    }
    
    
    
    @IBAction func saveButtonCLICKED(_ sender: Any){
    let name = nameField.text ?? ""
    let phone = phoneField.text ?? ""
    let newContact = contactClass(param1:name, param2: phone)
    delegate?.returnContact(newContact:newContact)
    
    _=navigationController?.popViewController(animated: true) //back one step
    
}

}

protocol addItemDelegate: class{
    func returnContact(newContact:contactClass)
}
