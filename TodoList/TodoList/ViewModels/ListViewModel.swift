//
//  ListViewModel.swift
//  TodoList
//
//  Created by Atul Parmar on 28/03/25.
//

import Foundation

/*
 CRUD FUNCTIONS
 
 Create
 Read
 Update
 Delete
 */

class ListViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = [] {
        didSet {
            saveItems()
        }
    }
    
    let itemsKey:String = "items_list"
    
    init () {
        getItems()
    }
    
    func getItems() {
//        let newItems = [
//            ItemModel(title: "Buy milk", isCompleted: false),
//            ItemModel(title: "Learn SwiftUI", isCompleted: true),
//            ItemModel(title: "Go for a walk", isCompleted: false)
//        ]
//        items.append(contentsOf: newItems)
        
        /*
        if let data = UserDefaults.standard.data(forKey: itemsKey) {
            do {
                items = try JSONDecoder().decode([ItemModel].self, from: data)
            } catch {
                print("Error decoding data: \(error)")
            }
        }*/
        
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItem = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }
        
        self.items = savedItem
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String) {
        items.append(ItemModel(title: title, isCompleted: false))
    }
    
    func updateItem(item:ItemModel) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item.updateCompletion()
        }
    }
    
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
}
