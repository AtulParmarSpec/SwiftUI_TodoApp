//
//  TodoListApp.swift
//  TodoList
//
//  Created by Atul Parmar on 27/03/25.
//

import SwiftUI

/*
 MVVM Architecture
 
 Model - Data point
 View - UI
 ViewModel - Manages Models for View
 
 
 */

@main
struct TodoListApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
