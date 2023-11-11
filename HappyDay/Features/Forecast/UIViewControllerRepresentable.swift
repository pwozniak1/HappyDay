import SwiftUI

struct BasicUIViewControllerRepresentable: UIViewControllerRepresentable {
    let viewModel: TodayViewModel

    typealias UIViewControllerType = ForecastController

    func makeUIViewController(context _: Context) -> ForecastController {
        let finalViewModel = ForecastController(viewModel: viewModel)
        return finalViewModel
    }

    func updateUIViewController(_: ForecastController, context _: Context) {}
}
