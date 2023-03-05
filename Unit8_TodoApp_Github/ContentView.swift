//
//  ContentView.swift
//  Unit8_TodoApp_Github
//
//  Created by Moez Rehman on 3/5/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var todos = [
    Todo(title: "Complete Unit 8"),
    Todo(title: "Complete Unit 9", isCompleted: false),
    Todo(title: "Unit 10"),
    Todo(title: "Rehab - Prototype", isCompleted: true)]
    
    var body: some View {
        NavigationStack {
            List($todos) { $todo in
                HStack{
                    Image(systemName: todo.isCompleted ? "checkmark.circle.fill" : "circle")
                        .onTapGesture {
                            todo.isCompleted.toggle()
                        }
                    Text(todo.title)
                        .strikethrough(todo.isCompleted)
                }
            }
            .navigationTitle("Todos")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
