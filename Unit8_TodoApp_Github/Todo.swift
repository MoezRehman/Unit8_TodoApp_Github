//
//  Todo.swift
//  Unit8_TodoApp_Github
//
//  Created by Moez Rehman on 3/5/23.
//

import Foundation

struct Todo: Identifiable{
    let id = UUID()
    var title: String
    var isCompleted = false
}
