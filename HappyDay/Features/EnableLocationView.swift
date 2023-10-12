import SwiftUI

struct EnableLocationView: View {
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var viewModel: TodayViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Image.locationFill
                .font(.system(size: 40))
                .padding(.top, 96)

            VStack(alignment: .leading, spacing: 0) {
                Text(viewModel.enableLocationViewTitlePart1)
                    .kerning(-2.56)
                Text(viewModel.enableLocationViewTitlePart2)
                    .kerning(-2.56)
                    .padding(.top, -15)
            }
            .font(.interBoldSize64Weight700)
            .padding(.top, 40)

            Text(viewModel.enableLocationViewTextMessage)
                .font(.interMediumSize16Weight500)
                .padding(.top, 40)

            enableLocationButton
                .padding(.top, 40)

            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.leading, 24)
        .background(
            GradientBackground(state: .blueGradient, startPoint: $viewModel.startPoint, endPoint: $viewModel.endPoint)
                .onAppear {
                    viewModel.startAnimation()
                }
        )
    }

    var enableLocationButton: some View {
        Button {
            viewModel.requestLocation()
        } label: {
            Text(viewModel.enableLocationViewButtonTitle)
                .font(.interSemiBoldSize16Weight600)
                .foregroundColor(colorScheme == .light ? .white : .black)
                .padding(.vertical, 8)
                .padding(.horizontal, 16)
                .background {
                    RoundedRectangle(cornerRadius: 28)
                        .fill(colorScheme == .light ? .black : .white)
                }
        }
    }
}

struct EnableLocationView_Previews: PreviewProvider {
    static var previews: some View {
        EnableLocationView(viewModel: TodayViewModel())
    }
}
