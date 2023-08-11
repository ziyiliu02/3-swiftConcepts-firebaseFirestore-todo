//
//  __swiftConcepts_firebaseFirestore_todoApp.swift
//  3-swiftConcepts-firebaseFirestore-todo
//
//  Created by Liu Ziyi on 11/8/23.
//

import FirebaseCore
import SwiftUI

@main
struct __swiftConcepts_firebaseFirestore_todoApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
