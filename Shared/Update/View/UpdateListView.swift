//
//  UpdateListView.swift
//  DoggyDogg (iOS)
//
//  Created by Максим Чикинов on 15.06.2022.
//

import SwiftUI

struct UpdateListView: View {
    @ObservedObject var store = UpdateStore()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(store.updates) { update in
                    NavigationLink(destination: UpdateDetailView(update: update)) {
                        UpdateCellView(update: update)
                    }
                }
                .onDelete { index in
                    store.updates.remove(at: index.first!)
                }
                .onMove { (source: IndexSet, destination: Int) in
                    store.updates.move(fromOffsets: source, toOffset: destination)
                }
            }
            
            /// Navigation modifiers
            .navigationTitle("Upadates")
            .navigationViewStyle(StackNavigationViewStyle())
            .navigationBarItems(
                leading: Button(action: addUpdate) { Text("Add Update") },
                trailing: EditButton()
            )
        }
    }
    
    private func addUpdate() {
        store.updates.append(
            Update(image: "Card1", title: "New Item", text: "text", date: "Jan 1")
        )
    }
    
}

struct UpdateListView_Previews: PreviewProvider {
    static var previews: some View {
        UpdateListView()
    }
}
