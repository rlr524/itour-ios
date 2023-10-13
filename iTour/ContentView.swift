//
//  ContentView.swift
//  iTour
//
//  Created by Rob Ranf on 10/10/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var mc
    /*
    Can use if you want a static sort, but we're giving the user the ability to choose the
    sort, so all sorting is done in DestinationListingView. If you wanted to do static sort,
    pull the List back into ContentView as well as the deleteDestination() method.
    
    @Query(sort: [SortDescriptor(\Destination.date), SortDescriptor(\Destination.priority, order: .reverse)]) var destinations: [Destination]
    */
    @State private var path = [Destination]()
    @State private var sortOrder = SortDescriptor(\Destination.name)
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack(path: $path) {
            DestinationListingView(sort: sortOrder, searchString: searchText)
                .navigationTitle("iTour")
                .navigationDestination(for: Destination.self, destination: EditDestinationView.init)
                .searchable(text: $searchText)
                .toolbar {
                    /*
                    Button(action: addSamples) {
                        Label("Add Samples",  systemImage: "bolt.fill")
                    }
                    */
                    Button(action: createDestination) {
                        Label("Add Destination", systemImage: "plus")
                    }
                    
                    Menu("Sort", systemImage: "arrow.up.arrow.down") {
                        Picker("Sort", selection: $sortOrder) {
                            Text("Name")
                                .tag(SortDescriptor(\Destination.name))
                            
                            Text("Priority")
                                .tag(SortDescriptor(\Destination.priority, order: .reverse))
                            
                            Text("Date")
                                .tag(SortDescriptor(\Destination.date))
                        }
                        .pickerStyle(.inline)
                    }
                }
        }
    }
    
    /*
    func addSamples() {
        let rome = Destination(name: "Rome")
        let seoul = Destination(name: "Seoul")
        let tokyo = Destination(name: "Tokyo")

        mc.insert(rome)
        mc.insert(seoul)
        mc.insert(tokyo)
    }
    */
    
    /// The createDestination() method will add a destination to the destinations array
    func createDestination() {
        let destination = Destination()
        mc.insert(destination)
        path = [destination]
    }
}

/*
Notice with XCode 15 and Swift 5.9, can now create a preview with less boilerplate by
simply using the #Preview macro instead of the Previews struct with PreviewProvider protocol.
What the #Preview macro, which is built in, does is generate that Previews struct -- with the
PreviewProvider protocol, containing the previews var, some View, etc. -- at compile time. This
is an example of a "freestanding expression macro" declared with a hash tag.
*/
 #Preview {
    ContentView()
}
