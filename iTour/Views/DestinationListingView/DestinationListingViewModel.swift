//
//  DestinationListingViewModel.swift
//  iTour
//
//  Created by Rob Ranf on 10/13/23.
//

import SwiftUI
import SwiftData

final class DestinationListingViewModel {
    @Environment(\.modelContext) var mc
    @Query(sort: [SortDescriptor(\Destination.date),
                  SortDescriptor(\Destination.priority,
                                  order: .reverse)]) var destinations: [Destination]
    
    /// The deleteDestination method will delete a destination from the destinations array upon
    /// user delete swipe.
    /// - Parameter indexSet: The index set of the destionations array
    func deleteDestination(_ indexSet: IndexSet) {
        for index in indexSet {
            let destination = destinations[index]
            mc.delete(destination)
        }
    }
}
