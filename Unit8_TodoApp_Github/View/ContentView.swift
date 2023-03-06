//
//  ContentView.swift
//  Unit8_TodoApp_Github
//
//  Created by Moez Rehman on 3/5/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var todoManager = TodoManager()
    @State var showAddSheet = false
    @State var showConfirmationAlert = false
    
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
                ToolbarItemGroup {
                    Button{
                        showConfirmationAlert = true
                    } label: {
                        Image(systemName: "list.bullet.clipboard.fill")
                    }
                    
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
            .alert("Load Sample Data? Warning: This cannot be undone", isPresented: $showConfirmationAlert){
                Button("Replace", role: .destructive) {
                    todoManager.loadSampleData()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
