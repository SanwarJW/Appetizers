//
//  Appetizer.swift
//  Appetizers
//
//  Created by sanwar on 30/07/24.
//

import Foundation

struct Appetizer: Decodable ,Identifiable{
    let id:Int
    let name:String
    let description:String
    let price:Double
    let imageURL:String
    let calories:Int
    let carbs:Int
    let protein:Int
    
}

struct AppetizerRequest:Decodable{
    let request:[Appetizer]
}

struct MockData{
    static let sampleAppetizer=Appetizer(id: 1, name: "Asian Flank Steak", description: "This perfectly thin cut just melts in your mouth.", price: 8.99, imageURL: "https://seanallen-course-backend.herokuapp.com/images/appetizers/asian-flank-steak.jpg", calories: 300, carbs: 0, protein: 14)
    
    static let appetizers=[sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer]
    
    
    static let sampleAppetizer1=Appetizer(id: 01, name: "Asian Flank Steak", description: "This perfectly thin cut just melts in your mouth.", price: 8.99, imageURL: "https://seanallen-course-backend.herokuapp.com/images/appetizers/asian-flank-steak.jpg", calories: 300, carbs: 0, protein: 14)
    
    static let sampleAppetizer2=Appetizer(id: 02, name: "Asian Flank Steak", description: "This perfectly thin cut just melts in your mouth.", price: 8.99, imageURL: "https://seanallen-course-backend.herokuapp.com/images/appetizers/asian-flank-steak.jpg", calories: 300, carbs: 0, protein: 14)
    
    static let sampleAppetizer3=Appetizer(id: 03, name: "Asian Flank Steak", description: "This perfectly thin cut just melts in your mouth.", price: 8.99, imageURL: "https://seanallen-course-backend.herokuapp.com/images/appetizers/asian-flank-steak.jpg", calories: 300, carbs: 0, protein: 14)
    
    static let appetizersList=[sampleAppetizer1, sampleAppetizer2, sampleAppetizer3]
    
    
}
