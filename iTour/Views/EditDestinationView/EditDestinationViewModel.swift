//
//  EditDestinationViewModel.swift
//  iTour
//
//  Created by Rob Ranf on 10/13/23.
//

import SwiftUI
import SwiftData

final class EditDestinationViewModel {
    @Environment(\.modelContext) var mc
    @State var newSightName = ""
    @State var newSightDetails = ""
    @State var path = [Destination]()
    @Bindable var destination: Destination = Destination()
    
    /// The createDestination() method will add a destination to the destinations array
    func createDestination() {
        let destination = Destination()
        mc.insert(destination)
        path = [destination]
    }
    
    func addSight() {
        guard newSightName.isEmpty == false else { return }
        
        withAnimation {
            let sight = Sight(name: newSightName, details: "")
            destination.sights.append(sight)
            newSightName = ""
        }
    }
}
