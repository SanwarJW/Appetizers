//
//  User.swift
//  Appetizers
//
//  Created by sanwar on 25/08/24.
//

import Foundation
struct User:Codable{
    var firstName:String=""
    var lastName:String=""
    var email:String=""
    var date:Date=Date.now
    var extraNapkins:Bool=false
    var frequentRefills:Bool=false
}
