import SwiftUI

struct SectionModel: Identifiable {
    let id = UUID()
    let title: String
    let items: [ItemModel]
}

struct ItemModel: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let subtitle: String
}
