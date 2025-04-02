//
//  ListRowView.swift
//  TodoList
//
//  Created by Atul Parmar on 27/03/25.
//

import SwiftUI

struct ListRowView: View {
    
    let item: ItemModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" :"circle")
                .foregroundStyle(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

#Preview ("this is a first preview", traits: .sizeThatFitsLayout){
    let item1 = ItemModel(title:"First Item", isCompleted:false)
    ListRowView(item: item1)
}

#Preview ("this is a second preview", traits: .sizeThatFitsLayout){
    let item2 = ItemModel(title:"Second Item", isCompleted:true)
    ListRowView(item: item2)
}
