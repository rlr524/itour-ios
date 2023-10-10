//
//  Destination.swift
//  iTour
//
//  Created by Rob Ranf on 10/10/23.
//

import Foundation
import SwiftData

// This needs to be a class because we need to be able to share the data around our app and
// remember that Class is passed by reference where Struct is passed by copy.
// Designate this as a SwiftData model by adding the @Model macro. This is an attached macro
// as identified with the @ as opposed to a freestanding macro, identified with a #.
@Model
class Destination {
    var name: String
    var details: String
    var date: Date
    var priority: Int
    
    // Initialize the Destination class with some default values: 
    // empty strings, the date of now, and a priority of 2
    init(name: String = "", details: String = "", date: Date = .now, priority: Int = 2) {
        self.name = name
        self.details = details
        self.date = date
        self.priority = priority
    }
}
