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
    @Query var destinations: [Destination]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(destinations) { destination in
                    VStack(alignment: .leading) {
                        Text(destination.name)
                            .font(.headline)
                        
                        Text(destination.date.formatted(date: .long, time: .shortened))
                    }
                }
            }
            .navigationTitle("iTour")
            .toolbar {
                Button(action: addSamples) {
                    Label("Add Samples",  systemImage: "bolt.fill")
                }
            }
        }
    }
    func addSamples() {
        let rome = Destination(name: "Rome")
        let seoul = Destination(name: "Seoul")
        let tokyo = Destination(name: "Tokyo")
        
        mc.insert(rome)
        mc.insert(seoul)
        mc.insert(tokyo)
    }
}

// Notice with XCode 15 and Swift 5.9, can now create a preview with less boilerplate by
// simply using the #Preview macro instead of the Previews struct with PreviewProvider protocol.
// What the #Preview macro, which is built in, does is generate that Previews struct -- with the
// PreviewProvider protocol, containing the previews var, some View, etc. -- at compile time. This
// is an example of a "freestanding expression macro" declared with a hash tag. 
#Preview {
    ContentView()
}
