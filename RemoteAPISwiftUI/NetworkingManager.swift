import Foundation
import SwiftUI
import Combine

class NetworkingManager : BindableObject {
    
    var didChange = PassthroughSubject<NetworkingManager, Never>()
    
    var todos = [Todo]() {
        didSet {
            didChange.send(self)
        }
    }
    
    init() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            
            guard let data = data else { return }
            do {
                let todos = try JSONDecoder().decode([Todo].self, from: data)
                
                DispatchQueue.main.async {
                    self.todos = todos
                    print(self.todos.identified(by: \.id))
                }
                
            } catch let err {
                print(err.localizedDescription)
            }
        }.resume()
    }
    
}
