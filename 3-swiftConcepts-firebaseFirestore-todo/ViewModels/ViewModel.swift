//
//  ViewModel.swift
//  3-swiftConcepts-firebaseFirestore-todo
//
//  Created by Liu Ziyi on 11/8/23.
//

import Foundation
import Firebase

class ViewModel: ObservableObject {
    
//    @Published var list = ["Cat", "Dog"]
    @Published var list = [Todo]()
    
    func deleteData(todoToDelete: Todo) {
        
        // Get a reference to the database
        let db = Firestore.firestore()
        
        // Specify the document to delete
        db.collection("todos").document(todoToDelete.id).delete { error in
            // Check for errors
            if error == nil {
                // No errors
                
                // Update the UI from the main thread
                DispatchQueue.main.async {
                    
                    // Remove the todo that was just deleted
                    self.list.removeAll { todo in
                        
                        // Check for the todo to remove
                        return todo.id == todoToDelete.id
                    }
                }
            }
        }
        
    }
    
    func addData(name: String, notes: String) {
        
        // Get a reference to the database
        let db = Firestore.firestore()
        
        // Add a document to a collection
        db.collection("todos").addDocument(data: ["name": name, "notes": notes]) { error in
            
            // Check for errors
            if error == nil {
                // No errors
                
                // Call get data to retrieve latest data
                self.getData()
            } else {
                // Handle the error
            }
            
        }
        
    }
    
    func getData() {
        
        // Get a reference to the DB
        let db = Firestore.firestore()
        
        // Read the documents at a specific path
        db.collection("todos").getDocuments { snapshot, error in
            
            // Check for errors
            if error == nil {
                // No errors
                
                if let snapshot = snapshot {
                    
                    // Update the list property in the main thread
                    DispatchQueue.main.async {
                        
                        // Get all the documents and create Todos
                        self.list = snapshot.documents.map { d in
                            
                            // Create a Todo item for each document returned
                            return Todo(id: d.documentID,
                                        name: d["name"] as? String ?? "",
                                        notes: d["notes"] as? String ?? "")
                        }
                        
                    }
                    
                }
                
            } else {
                // Handle the error
            }
            
        }
        
    }
    
}
