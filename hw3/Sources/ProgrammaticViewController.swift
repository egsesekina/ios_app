import UIKit

final class ProgrammaticViewController: UIViewController {

    private let tableView = UITableView(frame: .zero, style: .insetGrouped)
    private let detailLabel = UILabel()
    private let data = [
        "Apple", "Banana", "Orange", "Grape", "Mango",
        "Pineapple", "Peach", "Pear", "Cherry", "Kiwi"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Выберите элемент"

        setupTable()
        setupDetailLabel()
        layout()
    }

    private func setupTable() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
    }

    private func setupDetailLabel() {
        detailLabel.translatesAutoresizingMaskIntoConstraints = false
        detailLabel.text = "Ничего не выбрано"
        detailLabel.textAlignment = .center
        detailLabel.numberOfLines = 0
        detailLabel.font = .preferredFont(forTextStyle: .title2)
        detailLabel.textColor = .label
        detailLabel.backgroundColor = .secondarySystemBackground
        detailLabel.layer.cornerRadius = 12
        detailLabel.layer.masksToBounds = true
        detailLabel.setContentHuggingPriority(.required, for: .vertical)
    }

    private func layout() {
        view.addSubview(detailLabel)
        view.addSubview(tableView)

        let guide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            detailLabel.topAnchor.constraint(equalTo: guide.topAnchor, constant: 16),
            detailLabel.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 16),
            detailLabel.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -16),
            detailLabel.heightAnchor.constraint(equalToConstant: 120),

            tableView.topAnchor.constraint(equalTo: detailLabel.bottomAnchor, constant: 16),
            tableView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: guide.bottomAnchor)
        ])
    }
}

extension ProgrammaticViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var config = cell.defaultContentConfiguration()
        config.text = data[indexPath.row]
        cell.contentConfiguration = config
        cell.accessoryType = .disclosureIndicator
        return cell
    }
}

extension ProgrammaticViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selected = data[indexPath.row]
        detailLabel.text = "Вы выбрали: \(selected)"
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
