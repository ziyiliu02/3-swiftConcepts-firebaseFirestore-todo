//
//  ContentView.swift
//  3-swiftConcepts-firebaseFirestore-todo
//
//  Created by Liu Ziyi on 11/8/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var model = ViewModel()
    
    @State var name = ""
    @State var notes = ""
    
    var body: some View {
        
        VStack {
            
            List(model.list) { item in
                Text(item.name)
            }
            
            Divider()
            
            VStack(spacing: 5) {
                TextField("Name", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                TextField("Notes", text: $notes)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button {
                    // Call add data
                    model.addData(name: name, notes: notes)
                    
                    // Clear the text fields
                    name = ""
                    notes = ""
                } label: {
                    Text("Add Todo Item")
                }
            }
            
        }

    }
    
    init(){
        model.getData()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
