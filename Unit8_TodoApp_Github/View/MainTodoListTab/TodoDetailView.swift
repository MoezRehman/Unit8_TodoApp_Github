//
//  TodoDetailView.swift
//  Unit8_TodoApp_Github
//
//  Created by Moez Rehman on 3/5/23.
//

import SwiftUI

struct TodoDetailView: View {
    
    @Binding var todo: Todo
    
    var body: some View {
        Form {
            TextField("Title", text: $todo.title)
            TextField("Subtitle", text: $todo.subTitle)
                .foregroundColor(.gray)
            Toggle("Completed?", isOn: $todo.isCompleted)
        }
        .navigationTitle("Todo Detail")
    }
}

struct TodoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TodoDetailView(todo: .constant(Todo(title: "Some Fake Text")))
    }
}
