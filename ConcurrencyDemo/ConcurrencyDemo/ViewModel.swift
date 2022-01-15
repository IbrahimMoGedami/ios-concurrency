//
//  ViewModel.swift
//  ConcurrencyDemo
//
//  Created by Ibrahim Mo Gedami on 13/01/2022.
//

import Foundation

class ViewModel{
    @Published private(set) var todo : Todo?
    func loadData(){
        Task{
            do {
                let todo = try await loadToDo(id: 1)
                //MARK: 3th solve is to use MainActor
                await MainActor.run{
                    self.todo = todo
                }
                print("todo : \(todo)\n\n")
                /// if i want run more than process
                async let firstTodo = try loadToDo(id: 1)
                async let secondTodo = try loadToDo(id: 2)
                async let thirdTodo = try loadToDo(id: 3)
                async let fourthTodo = try loadToDo(id: 4)
                let result = try await [firstTodo,secondTodo,thirdTodo,fourthTodo]
                print(result)
            } catch  {
                debugPrint(error)
            }
        }
    }
    
    private func loadToDo(id : Int) async throws -> Todo{
        let (data , _) = try await URLSession.shared.getData(from: URL(string: "https://jsonplaceholder.typicode.com/todos/1")!)
        print(id)
        return try JSONDecoder().decode(Todo.self, from: data)

    }
}
