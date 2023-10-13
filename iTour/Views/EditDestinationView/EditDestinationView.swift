//
//  EditDestinationView.swift
//  iTour
//
//  Created by Rob Ranf on 10/10/23.
//

import SwiftUI
import SwiftData

struct EditDestinationView: View {
    @State private var vm = EditDestinationViewModel()
    
    var body: some View {
        Form {
            TextField("Name", text: vm.$destination.name)
            TextField("Details", text: vm.$destination.details)
            DatePicker("Date", selection: vm.$destination.date, displayedComponents: .date)
            
            Section("Priority") {
                Picker("Priority", selection: vm.$destination.priority) {
                    Text("Meh").tag(1)
                    Text("Maybe").tag(2)
                    Text("Must").tag(3)
                }
                .pickerStyle(.segmented)
            }
            
            Section("Sights") {
                ForEach(vm.destination.sights) {sight in
                    Text(sight.name)
                    Text(sight.details)
                }
            }
            
            Section("Add a Sight") {
                VStack {
                    TextField("Sight name", text: vm.$newSightName)
                    TextField("Sight details", text: vm.$newSightDetails)
                }
            }
        }
        .navigationTitle("Edit Destination")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Destination.self, configurations: config)
        let example = Destination(name: "Example Destination", details: "Example details go here and will automatically expand vertically as they are edited.")
        return EditDestinationView()
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container.")
    }
}
