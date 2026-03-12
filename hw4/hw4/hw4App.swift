import SwiftUI

@main
struct hw4App: App {
    var body: some Scene {
        WindowGroup {

            TabView {

                SwiftUICollectionScreen(sections: mockSections)
                    .tabItem {
                        Label("SwiftUI", systemImage: "swift")
                    }

                UIKitWrapper()
                    .tabItem {
                        Label("UIKit", systemImage: "square.grid.2x2")
                    }
            }
        }
    }
}
