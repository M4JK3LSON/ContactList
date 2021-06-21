//
//  addingItemClass.swift
//  contactList
//
//  Created by Michal L on 13.04.2021.
//  Copyright © 2021 Michal L. All rights reserved.
//

import UIKit
class generalViewClass: UIViewController, addItemDelegate, modifyItemDelegate {
    func returnContact(newContact: contactClass) {
        contactData.append(newContact)
        tableViewReferens.reloadData()
    }
    func refreshContact(contactToRefresh: contactClass,arrayIndex: Int){
        contactData[arrayIndex].contactName = contactToRefresh.contactName
        contactData[arrayIndex].phoneNumber = contactToRefresh.phoneNumber
        tableViewReferens.reloadData()
    }
    
    @IBOutlet weak var tableViewReferens: UITableView!
    
    @IBAction func secondChance(_ sender: UIBarButtonItem) {
    }
    
    override func viewDidLoad() {
            super.viewDidLoad()
            title="Contacts"
        navigationController?.navigationBar.prefersLargeTitles=true
        tableViewReferens.delegate=self
        tableViewReferens.dataSource=self
        let defaultContact = contactClass(param1: "My Number", param2: "+48 111 222 333")
        contactData.append(defaultContact)
       
        }
    var selectedContact = contactClass()
    var contactData: [contactClass] = []
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedContact  = self.contactData[indexPath.row]
        self.selectedContact.Index = indexPath.item
        let alert = UIAlertController(title: "Selected Item:",message: "NAME: " + self.contactData[indexPath.row].contactName + " INDEX:" + String(self.contactData[indexPath.row].Index), preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let addItemvc = segue.destination as? addItem{
            addItemvc.delegate=self
        }else if let modifyItemvc = segue.destination as? modifyExistingItemClass{
            modifyItemvc.writeContact(selectedElement: selectedContact)
            modifyItemvc.delegate=self
        }
    }
    weak var delegate: returnSelectedElement?
}
extension generalViewClass: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let name = contactData[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell")as!customeTableCellTableViewCell
        cell.setLabelContent(name:name.contactName,phone:name.phoneNumber)
        return cell
    }
    
}


protocol returnSelectedElement : class{
    func writeContact(selectedElement: contactClass)
}

