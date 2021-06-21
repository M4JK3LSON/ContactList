//
//  contactClass.swift
//  contactList
//
//  Created by Michal L on 14.04.2021.
//  Copyright © 2021 Michal L. All rights reserved.
//

import Foundation

public class contactClass {
   
    var contactName : String = ""
    var phoneNumber : String = ""
    var Index: Int = 0
    
    
    init(param1: String, param2: String){
    self.contactName = param1
    self.phoneNumber = param2
    }
    
    init(){
        
    }

}
