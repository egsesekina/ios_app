import SwiftUI

struct FirstView: View {
    
    @State private var name: String = ""
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                
                if name.isEmpty {
                    Text("Hello")
                        .font(.largeTitle)
                } else {
                    Text("Hello, \(name)")
                        .font(.largeTitle)
                }
                
                NavigationLink("Ввести имя") {
                    SecondView(name: $name)
                }
                .buttonStyle(.borderedProminent)
                
            }
            .navigationTitle("Первый экран")
        }
    }
}
