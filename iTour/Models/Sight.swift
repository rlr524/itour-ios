//
//  Sight.swift
//  iTour
//
//  Created by Rob Ranf on 10/12/23.
//

import Foundation
import SwiftData

@Model
class Sight {
    var name: String
    var details: String
    
    init(name: String, details: String) {
        self.name = name
        self.details = details
    }
}
