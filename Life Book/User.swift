//
//  User.swift
//  Life Book
//
//  Created by Alexander Bustos on 8/3/17.
//  Copyright © 2017 App Factory. All rights reserved.
//

import Foundation
import RealmSwift

class User: Object {
    dynamic var username = ""
    dynamic var token = ""
    
    override static func primaryKey() -> String? {
        return "username"
    }
}
