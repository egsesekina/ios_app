import UIKit

struct ImageItem {
    let imageName: String
    let title: String
}

class MainViewController: UIViewController {

    // Массив картинок
    private let items: [ImageItem] = [
        ImageItem(imageName: "pic1", title: "Рыбка с кус-кусом"),
        ImageItem(imageName: "pic2", title: "Фаршированные перцы"),
        ImageItem(imageName: "pic3", title: "Чизкейк"),
        ImageItem(imageName: "pic4", title: "Запеченый камамбер")
    ]

    private var currentIndex = 0

    private let headerLabel = UILabel()
    private let imageView = UIImageView()
    private let nameLabel = UILabel()
    private let leftButton = UIButton(type: .system)
    private let rightButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        updateUI()
    }

    private func setupUI() {

        // Заголовок
        headerLabel.text = "Еда моей мамы"
        headerLabel.font = .systemFont(ofSize: 28, weight: .bold)
        headerLabel.textAlignment = .center

        // Картинка
        imageView.contentMode = .scaleAspectFit

        // Название
        nameLabel.font = .systemFont(ofSize: 20)
        nameLabel.textAlignment = .center

        // Кнопка назад
        leftButton.setTitle("←", for: .normal)
        leftButton.titleLabel?.font = .systemFont(ofSize: 32)
        leftButton.addTarget(self, action: #selector(previousImage), for: .touchUpInside)

        // Кнопка вперёд
        rightButton.setTitle("→", for: .normal)
        rightButton.titleLabel?.font = .systemFont(ofSize: 32)
        rightButton.addTarget(self, action: #selector(nextImage), for: .touchUpInside)

        let buttonStack = UIStackView(arrangedSubviews: [leftButton, rightButton])
        buttonStack.axis = .horizontal
        buttonStack.spacing = 60
        buttonStack.distribution = .equalCentering

        let mainStack = UIStackView(arrangedSubviews: [
            headerLabel,
            imageView,
            nameLabel,
            buttonStack
        ])

        mainStack.axis = .vertical
        mainStack.spacing = 25
        mainStack.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(mainStack)

        NSLayoutConstraint.activate([
            mainStack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            mainStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            mainStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            imageView.heightAnchor.constraint(equalToConstant: 250)
        ])
    }

    private func updateUI() {
        let item = items[currentIndex]
        imageView.image = UIImage(named: item.imageName)
        nameLabel.text = item.title
    }

    @objc private func previousImage() {
        currentIndex = (currentIndex - 1 + items.count) % items.count
        updateUI()
    }

    @objc private func nextImage() {
        currentIndex = (currentIndex + 1) % items.count
        updateUI()
    }
}
