//
//  modifyExistingItemClass.swift
//  contactList
//
//  Created by Michal L on 13.04.2021.
//  Copyright © 2021 Michal L. All rights reserved.
//

import UIKit

class modifyExistingItemClass: UIViewController, returnSelectedElement {

    
    
    weak var delegate: modifyItemDelegate?
    var trueIndex: Int?
    @IBOutlet weak var nameTextBox: UITextField!
    @IBOutlet weak var phoneTextBox: UITextField!
    
    
    
    func writeContact(selectedElement: contactClass){
        //let storyboard = UIStoryboard(name: "generalViewClass", bundle: nil)
        //let destVC = storyboard.instantiateViewController(withIdentifier: "modifyExistingItemClass")
        //self.navigationController?.pushViewController(destVC, animated: true)
        
//
        let alert = UIAlertController(title: "Selected Index2:",message: selectedElement.contactName, preferredStyle: UIAlertController.Style.alert)
                      alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
                       self.present(alert, animated: true, completion: nil)
        nameTextBox.text = selectedElement.contactName
        phoneTextBox.text = selectedElement.phoneNumber
        trueIndex = selectedElement.Index
    }

    @IBAction func saveIt(_ sender: Any) {
        let newName = nameTextBox.text ?? ""
        let newNumber = phoneTextBox.text ?? ""
        let modifiedContact = contactClass(param1: newName, param2: newNumber)
        delegate?.refreshContact(contactToRefresh: modifiedContact, arrayIndex: self.trueIndex!)
        _=navigationController?.popViewController(animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let returnItemvc = segue.destination as? generalViewClass{
            returnItemvc.delegate=self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title="Modify Item"
    }
}

protocol modifyItemDelegate: class{
    func refreshContact(contactToRefresh: contactClass,arrayIndex: Int)
}
