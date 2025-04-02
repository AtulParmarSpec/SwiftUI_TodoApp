//
//  NoItemsView.swift
//  TodoList
//
//  Created by Atul Parmar on 01/04/25.
//

import SwiftUI

struct NoItemsView: View {
    
    @State var animate: Bool = false
    
    var body: some View {
        ScrollView {
            VStack (spacing: 10) {
                Text("No items to show")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Are you a productive person? I thing you should click on the add button and add your first item in the todo list.")
                    .padding(.bottom, 20)
                NavigationLink {
                    AddView()
                } label: {
                    Text("Add Item 🥳")
                        .foregroundStyle(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(animate ? Color.secondaryAccent : Color.accent)
                        .cornerRadius(10)
                }
                .padding(.horizontal, animate ? 30 : 50 )
                .shadow(
                    color: animate ? Color.secondaryAccent.opacity(0.7) : Color.accent.opacity(0.7),
                    radius: animate ? 30 : 10,
                    x: 0,
                    y: animate ? 50 : 30
                )
                .scaleEffect(animate ? 1.1 : 1)
                .offset(y: animate ? -7 : 0)

            }
            .frame(maxWidth: 400)
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func addAnimation() {
        
        guard !animate else { return }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ) {
                self.animate.toggle()
            }
        }
    }
}

#Preview {
    NoItemsView()
}
