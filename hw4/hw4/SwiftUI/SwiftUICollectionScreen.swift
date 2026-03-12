import SwiftUI

struct SwiftUICollectionScreen: View {

    let sections: [SectionModel]

    var body: some View {
        
        ScrollView {
            LazyVStack(spacing: 16) {
                ForEach(sections) { section in

                    Text(section.title)
                        .font(.headline)

                    ForEach(section.items) { item in
                        ItemRow(item: item)
                    }
                }
            }
            .padding()
        }
    }
 
}
