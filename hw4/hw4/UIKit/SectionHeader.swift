import UIKit
import SwiftUI

class SectionHeader: UICollectionReusableView {

    static let reuseId = "header"

    let titleLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)

        titleLabel.font = .systemFont(ofSize: 16, weight: .bold)
        titleLabel.textAlignment = .center // center-aligned
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleLabel)

        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),    // add top padding
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8) // add bottom padding
        ])
    }

    required init?(coder: NSCoder) { fatalError() }
}
