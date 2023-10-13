//
//  DestinationListingView.swift
//  iTour
//
//  Created by Rob Ranf on 10/11/23.
//

import SwiftUI
import SwiftData

struct DestinationListingView: View {
    @State private var vm = DestinationListingViewModel()
    @Query(sort: [SortDescriptor(\Destination.date), SortDescriptor(\Destination.priority, order: .reverse)]) var destinations: [Destination]

    var body: some View {
        List {
            ForEach(destinations) { destination in
                NavigationLink(value: destination) {
                    VStack(alignment: .leading) {
                        Text(destination.name)
                            .font(.headline)
                        
                        Text(destination.date.formatted(date: .long, time: .omitted))
                    }
                }
            }
            .onDelete(perform: vm.deleteDestination)
        }
    }
    
    //TODO: Refactor this to search both name and description
    /// The initializer takes in a sorting descriptor and a search predicate
    /// - Parameters:
    ///   - sort: A sort descriptor using the sort array defined for the struct
    ///   - searchString: A search string allowing filtering by trip name
    init(sort: SortDescriptor<Destination>, searchString: String) {
        // The underscore indicates that we're referring to the destinations query
        // itself, not the actual object that is an array of destinations.
        _destinations = Query(filter: #Predicate {
            if searchString.isEmpty {
                return true
            } else {
                // localizedStandardContains handles case, localization / language, etc
                // based on the user's localization settings on their device
                return $0.name.localizedStandardContains(searchString)
            }
        }, sort: [sort])
    }
    
    // Example of an initializer using a static filter to filter on priority >= 2 or future date
//    init (sort: SortDescriptor<Destination>) {
//        let now = Date.now
//        _destinations = Query(filter: #Predicate {
//            $0.priority >= 2
//        _destinations = Query(filter: #Predicate {
//            $0.date > now
//        }, sort: [sort])
//    }
}

#Preview {
    DestinationListingView(sort: SortDescriptor(\Destination.name), searchString: "")
}
