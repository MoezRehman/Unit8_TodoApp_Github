//
//  HowManyMoreView.swift
//  Unit8_TodoApp_Github
//
//  Created by Moez Rehman on 3/7/23.
//

import SwiftUI

struct HowManyMoreView: View {
    
    @ObservedObject var todoManager: TodoManager
    
    var body: some View {
        VStack {
            Text("You have:")
                .font(.largeTitle)
            Text("\(todoManager.numTodosLeft)")
                .font(.system(size: 140))
                .foregroundColor(.accentColor)
                .padding()
            Text("Todos left:")
                .font(.largeTitle)
            Text("You have completed \(todoManager.numTodosDone) todos. Good Job.")
                .padding()
            
        }
        
    }
}

struct HowManyMoreView_Previews: PreviewProvider {
    static var previews: some View {
        HowManyMoreView(todoManager: TodoManager())
    }
}
