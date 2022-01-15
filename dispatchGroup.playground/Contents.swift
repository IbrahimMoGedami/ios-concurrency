//: A UIKit based Playground for presenting user interface
  
import UIKit

func getData(){
    
    let urls = ["https://api.google.com1",
                "https://api.google.com1",
                "https://api.google.com1"
    ]
    
    let group = DispatchGroup()
    
    for url in urls{
        
        guard let url = URL(string: url) else { continue }
        group.enter() // because the completion handeler in data task is async
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            defer {
                group.leave()
            }
            guard let data = data else { return }
            print(data)
        }
        task.resume()
    }
    group.notify(queue: .main) {
        <#code#>
    }
}
