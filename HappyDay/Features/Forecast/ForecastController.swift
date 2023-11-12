import UIKit

class ForecastController: UIViewController {
    private let today = Date().formatted(date: .abbreviated, time: .omitted)
    private let tomorrow = Calendar.current.date(byAdding: .day, value: 1, to: Date())?.formatted(date: .abbreviated, time: .omitted)
    private let thirdDay = Calendar.current.date(byAdding: .day, value: 2, to: Date())?.formatted(date: .abbreviated, time: .omitted)
    private let fourthDay = Calendar.current.date(byAdding: .day, value: 3, to: Date())?.formatted(date: .abbreviated, time: .omitted)
    private let fifthDay = Calendar.current.date(byAdding: .day, value: 4, to: Date())?.formatted(date: .abbreviated, time: .omitted)
    private let sixthDay = Calendar.current.date(byAdding: .day, value: 5, to: Date())?.formatted(date: .abbreviated, time: .omitted)

    private var viewModel: TodayViewModel

    var listToday: [ListForecast] = []
    var listTomorrow: [ListForecast] = []
    var listThirdDay: [ListForecast] = []
    var listFourthDay: [ListForecast] = []
    var listFifthDay: [ListForecast] = []
    var listSixthDay: [ListForecast] = []

    init(viewModel: TodayViewModel) {
        self.viewModel = viewModel

        if viewModel.weatherResponse != nil {
            if let items = viewModel.weatherResponse?.list {
                for item in items {
                    if let finalItem = item.customCurrentDate {
                        if finalItem == today.description {
                            listToday.append(item)
                        } else if finalItem == tomorrow!.description {
                            listTomorrow.append(item)
                        } else if finalItem == thirdDay!.description {
                            listThirdDay.append(item)
                        } else if finalItem == fourthDay!.description {
                            listFourthDay.append(item)
                        } else if finalItem == fifthDay!.description {
                            listFifthDay.append(item)
                        } else if finalItem == sixthDay!.description {
                            listSixthDay.append(item)
                        } else {
                            viewModel.apiStateForecast = .error
                        }
                    }
                }
            }
        }
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("Fatal error")
    }

    private let bView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBackground
        return view
    }()

    private let forecastLabel: UILabel = {
        let title = UILabel()
        title.font = UIFont.interBoldSize40Weight700
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = String.LocalizableUIKit.forecastControllerForecastTitle
        return title
    }()

    private let tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .systemBackground
        table.register(WeatherTableCell.self, forCellReuseIdentifier: WeatherTableCell.id)
        table.register(TableSectionHeader.self, forHeaderFooterViewReuseIdentifier: TableSectionHeader.id)
        table.separatorStyle = .none
        table.allowsSelection = false
        table.showsVerticalScrollIndicator = false
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        view.backgroundColor = .systemBackground
    }

    private func setupUI() {
        view.addSubviews(bView, tableView)
        bView.addSubview(forecastLabel)
        tableView.dataSource = self
        tableView.delegate = self

        NSLayoutConstraint.activate([
            bView.topAnchor.constraint(equalTo: view.topAnchor, constant: -20),
            bView.leftAnchor.constraint(equalTo: view.leftAnchor),
            bView.rightAnchor.constraint(equalTo: view.rightAnchor),
            bView.heightAnchor.constraint(equalToConstant: 143),

            forecastLabel.bottomAnchor.constraint(equalTo: bView.bottomAnchor, constant: -8),
            forecastLabel.leftAnchor.constraint(equalTo: bView.leftAnchor, constant: 24),

            tableView.topAnchor.constraint(equalTo: bView.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension ForecastController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in _: UITableView) -> Int {
        return sections.count
    }

    func tableView(_: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch sections[section].section {
        case .today:
            return listToday.count + 1
        case .tomorrow:
            return listTomorrow.count
        case .thirdDay:
            return listThirdDay.count
        case .fourthDay:
            return listFourthDay.count
        case .fifthDay:
            return listFifthDay.count
        case .sixthDay:
            return listSixthDay.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch sections[indexPath.section].section {
        case .today:
            switch indexPath.row {
            case 0:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: WeatherTableCell.id, for: indexPath) as? WeatherTableCell else {
                    return updateWeatherTableCell()
                }
                if let list = viewModel.todayWeather {
                    cell.configureCurrent(current: list)
                }
                return cell
            default:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: WeatherTableCell.id, for: indexPath) as? WeatherTableCell else {
                    return updateWeatherTableCell()
                }
                let list = listToday[indexPath.row - 1]
                cell.configure(list: list)

                return cell
            }

        case .tomorrow:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: WeatherTableCell.id, for: indexPath) as? WeatherTableCell else {
                return updateWeatherTableCell()
            }
            let list = listTomorrow[indexPath.row]
            cell.configure(list: list)

            return cell

        case .thirdDay:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: WeatherTableCell.id, for: indexPath) as? WeatherTableCell else {
                return updateWeatherTableCell()
            }
            let list = listThirdDay[indexPath.row]
            cell.configure(list: list)

            return cell

        case .fourthDay:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: WeatherTableCell.id, for: indexPath) as? WeatherTableCell else {
                return updateWeatherTableCell()
            }
            let list = listFourthDay[indexPath.row]
            cell.configure(list: list)

            return cell

        case .fifthDay:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: WeatherTableCell.id, for: indexPath) as? WeatherTableCell else {
                return updateWeatherTableCell()
            }
            let list = listFifthDay[indexPath.row]
            cell.configure(list: list)

            return cell

        case .sixthDay:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: WeatherTableCell.id, for: indexPath) as? WeatherTableCell else {
                return updateWeatherTableCell()
            }
            let list = listSixthDay[indexPath.row]
            cell.configure(list: list)

            return cell
        }
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: TableSectionHeader.id) as? TableSectionHeader else {
            fatalError("TableSectionHeader failed to load")
        }
        switch sections[section].section {
        case .today:
            if let dateHeader = listToday.first?.customCurrentDate {
                header.configure(day: sections[section].section.headerName, completeDay: dateHeader)
            }
            return header
        case .tomorrow:
            if let dateHeader = listTomorrow.first?.customCurrentDate {
                header.configure(day: sections[section].section.headerName, completeDay: dateHeader)
            }
            return header
        case .thirdDay:
            if let dateHeader = listThirdDay.first?.customCurrentDate {
                header.configure(day: sections[section].section.headerName, completeDay: dateHeader)
            }
            return header

        case .fourthDay:
            if let dateHeader = listFourthDay.first?.customCurrentDate {
                header.configure(day: sections[section].section.headerName, completeDay: dateHeader)
            }
            return header

        case .fifthDay:
            if let dateHeader = listFifthDay.first?.customCurrentDate {
                header.configure(day: sections[section].section.headerName, completeDay: dateHeader)
            }
            return header

        case .sixthDay:
            if let dateHeader = listSixthDay.first?.customCurrentDate {
                header.configure(day: sections[section].section.headerName, completeDay: dateHeader)
            }
            return header
        }
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)

        if traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection) {
            tableView.reloadData()
        }
    }

    func tableView(_: UITableView, heightForHeaderInSection _: Int) -> CGFloat {
        return 56
    }

    func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
        return 72
    }

    func tableView(_: UITableView, willDisplay cell: UITableViewCell, forRowAt _: IndexPath) {
        let verticalPadding: CGFloat = 8

        let maskLayer = CALayer()
        maskLayer.cornerRadius = 16
        maskLayer.backgroundColor = UIColor.black.cgColor
        maskLayer.frame = CGRect(
            x: cell.bounds.origin.x,
            y: cell.bounds.origin.y,
            width: cell.bounds.width,
            height: cell.bounds.height
        ).insetBy(dx: 0, dy: verticalPadding / 2)
        cell.layer.mask = maskLayer
    }

    func updateWeatherTableCell() -> WeatherTableCell {
        if UITraitCollection.current.userInterfaceStyle == .dark {
            let cell = WeatherTableCell()
            cell.backgroundColor = UIColor.white.withAlphaComponent(0.2)
            return cell
        } else {
            let cell = WeatherTableCell()
            cell.backgroundColor = UIColor.customWhite
            return cell
        }
    }
}
