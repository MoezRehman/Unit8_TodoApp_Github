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
        Todo(title: "Rehab - Prototype", subTitle: "to test idea with OT", isCompleted: true)]
    
    @State var showAddSheet = false
    
    var body: some View {
        NavigationStack {
            List($todos, editActions: [.all]) { $todo in
                NavigationLink {
                    TodoDetailView(todo: $todo)
                } label: {
                    
                    HStack{
                        Image(systemName: todo.isCompleted ? "checkmark.circle.fill" : "circle")
                            .onTapGesture {
                                todo.isCompleted.toggle()
                            }
                        
                        VStack {
                            Text(todo.title)
                                .strikethrough(todo.isCompleted)
                            if !todo.subTitle.isEmpty {
                                Text(todo.subTitle)
                                    .font(.footnote)
                                    .foregroundColor(.gray)
                                    .strikethrough(todo.isCompleted)
                            }
                        }
                    }
                }
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
                NewTodoView(sourceTodos: $todos)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
