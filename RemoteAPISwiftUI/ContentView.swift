import SwiftUI

struct ContentView : View {
    
    @State var networkManager = NetworkingManager()
    
    var body: some View {
        
        List(networkManager.todos.identified(by: \.id)) { data in
            VStack {
                Text(data.title)
                    .padding(8)
                    .font(.subheadline)
            }
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
