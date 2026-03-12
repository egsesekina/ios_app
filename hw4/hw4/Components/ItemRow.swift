import SwiftUI

struct ItemRow: View {

    let item: ItemModel

    var body: some View {
        VStack(alignment: .leading) {
            Text(item.title)
                .font(.headline)

            Text(item.subtitle)
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color(.secondarySystemBackground))
        .cornerRadius(12)
    }
}
