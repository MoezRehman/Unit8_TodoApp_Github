//
//  ContentView.swift
//  Unit8_TodoApp_Github
//
//  Created by Moez Rehman on 3/5/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var todoManager = TodoManager()
    
//    @State var todos = [
//        Todo(title: "Complete Unit 8"),
//        Todo(title: "Complete Unit 9", isCompleted: false),
//        Todo(title: "Unit 10"),
//        Todo(title: "Rehab - Prototype", subTitle: "to test idea with OT", isCompleted: true)]
    
    @State var showAddSheet = false
    
    var body: some View {
        NavigationStack {
            List($todoManager.todos, editActions: [.all]) { $todo in
                TodoRowView(todo: $todo)
            }
            .navigationTitle("Todos")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading){
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showAddSheet = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showAddSheet){
                NewTodoView(sourceTodos: $todoManager.todos)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
