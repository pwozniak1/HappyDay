import AVFoundation
import UIKit

class WeatherTableCell: UITableViewCell {
    static let id = "WeatherTableCell"

    private let imageBackView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBackground
        view.layer.cornerRadius = 48 / 2
        return view
    }()

    private let img: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFit
        img.clipsToBounds = true
        return img
    }()

    private let tempLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .clear
        return label
    }()

    private let timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .clear
        return label
    }()

    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .clear
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        if UITraitCollection.current.userInterfaceStyle == .dark {
            contentView.backgroundColor = UIColor.white.withAlphaComponent(0.2)
        } else {
            contentView.backgroundColor = UIColor.customWhite
        }

        setupUI()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("Fatal error")
    }

    private func setupUI() {
        contentView.addSubviews(imageBackView, descriptionLabel, tempLabel, timeLabel)
        imageBackView.addSubviews(img)

        contentView.layer.cornerRadius = 16

        NSLayoutConstraint.activate([
            imageBackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            imageBackView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            imageBackView.heightAnchor.constraint(equalToConstant: 48),
            imageBackView.widthAnchor.constraint(equalToConstant: 48),

            img.centerYAnchor.constraint(equalTo: imageBackView.centerYAnchor),
            img.centerXAnchor.constraint(equalTo: imageBackView.centerXAnchor),

            timeLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            timeLabel.leftAnchor.constraint(equalTo: imageBackView.rightAnchor, constant: 17),
            timeLabel.bottomAnchor.constraint(equalTo: descriptionLabel.topAnchor),
            timeLabel.heightAnchor.constraint(equalToConstant: 24),

            descriptionLabel.topAnchor.constraint(equalTo: timeLabel.bottomAnchor),
            descriptionLabel.leftAnchor.constraint(equalTo: imageBackView.rightAnchor, constant: 17),
            descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 16),

            tempLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            tempLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16),
            tempLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        img.image = nil
        timeLabel.text = nil
        tempLabel.text = nil
        descriptionLabel.text = nil
    }

    func configure(list: ListForecast) {
        timeLabel.text = list.customTimeHourValue
        timeLabel.font = UIFont.interMediumSize16Weight500

        tempLabel.text = list.main?.customTempValue
        tempLabel.font = UIFont.interSemiBoldSize32Weight600

        descriptionLabel.text = list.weather?.first?.customDescriptionValue
        descriptionLabel.font = UIFont.interMediumSize14Weight500
        descriptionLabel.textColor = UIColor.customGray

        if let imageName = list.weather?.first?.imageName {
            let image = UIImage(named: imageName)

            if let finalImage = image?.resizeUI(size: CGSize(width: 24, height: 24)) {
                img.image = finalImage
            }
        }
    }

    func configureCurrent(current: CurrentWeather) {
        timeLabel.text = String.LocalizableUIKit.weatherTableCellHeader
        timeLabel.font = UIFont.interMediumSize16Weight500

        tempLabel.text = current.customTempValue
        tempLabel.font = UIFont.interSemiBoldSize32Weight600

        descriptionLabel.text = current.weather?.first?.customDescriptionValue
        descriptionLabel.font = UIFont.interMediumSize14Weight500
        descriptionLabel.textColor = UIColor.customGray

        if let imageName = current.weather?.first?.imageName {
            let image = UIImage(named: imageName)

            if let finalImage = image?.resizeUI(size: CGSize(width: 24, height: 24)) {
                img.image = finalImage
            }
        }
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)

        if traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection) {
            updateBackgroundColor()
        }
    }

    private func updateBackgroundColor() {
        if UITraitCollection.current.userInterfaceStyle == .dark {
            contentView.backgroundColor = UIColor.white.withAlphaComponent(0.2)
        } else {
            contentView.backgroundColor = UIColor.customWhite
        }
    }
}
