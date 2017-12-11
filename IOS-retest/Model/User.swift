//
//  User.swift
//  IOS-retest
//
//  Created by Laurence on 04/12/2017.
//  Copyright © 2017 Hetic. All rights reserved.
//

import Foundation
import SwiftyJSON

class User {
    var firstname: String
    var lastname: String
    var email: String
    var phone: String
    var pictureUrl: String
    
    init(json: JSON){
        self.firstname = json["name"]["first"].stringValue
        self.lastname = json["name"]["last"].stringValue
        self.email = json["email"].stringValue
        self.phone = json["phone"].stringValue
        self.pictureUrl = json["picture"]["medium"].stringValue
    }
}
