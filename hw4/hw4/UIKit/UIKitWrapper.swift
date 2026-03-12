import SwiftUI

struct UIKitWrapper: UIViewControllerRepresentable {

    func makeUIViewController(context: Context) -> UIKitCollectionViewController {
        UIKitCollectionViewController()
    }

    func updateUIViewController(_ uiViewController: UIKitCollectionViewController, context: Context) {}
}
