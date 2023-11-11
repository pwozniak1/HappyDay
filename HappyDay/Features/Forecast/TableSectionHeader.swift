import UIKit

class TableSectionHeader: UITableViewHeaderFooterView {
    static let id = "TableSectionHeader"

    private let dayLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        return label
    }()

    private let completeDayLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    func configure(day: String, completeDay: String) {
        dayLabel.text = day
        completeDayLabel.text = completeDay
        completeDayLabel.textColor = UIColor.customGray
        completeDayLabel.font = UIFont.interMediumSize14Weight500
        setupUI()
    }

    private func setupUI() {
        addSubviews(dayLabel, completeDayLabel)

        NSLayoutConstraint.activate([
            dayLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            dayLabel.leftAnchor.constraint(equalTo: leftAnchor),
            dayLabel.heightAnchor.constraint(equalToConstant: 24),

            completeDayLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            completeDayLabel.rightAnchor.constraint(equalTo: rightAnchor),
            completeDayLabel.heightAnchor.constraint(equalToConstant: 16)
        ])
    }
}
