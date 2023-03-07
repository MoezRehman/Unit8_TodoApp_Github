//
//  NewTodoView.swift
//  Unit8_TodoApp_Github
//
//  Created by Moez Rehman on 3/5/23.
//

import SwiftUI

struct NewTodoView: View {
    
    @State var title = ""
    @State var subtitle = ""
    @Binding var sourceTodos: [Todo]
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Form {
            Section("Todo Info"){
                TextField("Title", text: $title)
                TextField("Subtitle", text: $subtitle)
                
            }
            Section("Actions") {
                Button {
                    let todo = Todo(title: title, subTitle: subtitle)
                    sourceTodos.append(todo)
                    dismiss()
                } label: {
                    Text("Save")
                }
                Button("Cancel", role: .destructive){
                    dismiss()
                }
            }
        }
    }
}

struct NewTodoView_Previews: PreviewProvider {
    static var previews: some View {
        NewTodoView(sourceTodos: .constant([]))
    }
}
