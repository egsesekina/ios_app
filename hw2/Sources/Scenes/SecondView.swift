import SwiftUI

struct SecondView: View {
    
    @Binding var name: String
    @Environment(\.dismiss) var dismiss
    
    @State private var tempName: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            
            TextField("Введите имя", text: $tempName)
                .textFieldStyle(.roundedBorder)
                .padding()
            
            Button("Сохранить и вернуться") {
                name = tempName
                dismiss()
            }
            .buttonStyle(.borderedProminent)
            
        }
        .navigationTitle("Ввод имени")
        .onAppear {
            tempName = name
        }
        .padding()
    }
}
