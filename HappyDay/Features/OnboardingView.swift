import SwiftUI

struct OnboardingView: View {
    @StateObject var viewModel = TodayViewModel()

    var body: some View {
        Group {
            if viewModel.userLocation == nil {
                EnableLocationView(viewModel: viewModel)
            } else {}
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
