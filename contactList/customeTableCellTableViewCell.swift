//
//  customeTableCellTableViewCell.swift
//  contactList
//
//  Created by Michal L on 14.04.2021.
//  Copyright © 2021 Michal L. All rights reserved.
//

import UIKit

class customeTableCellTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var phoneLabel: UILabel!
    
    public func setLabelContent(name:String, phone:String){
        nameLabel.text=name
        phoneLabel.text=phone
    }
    
}
