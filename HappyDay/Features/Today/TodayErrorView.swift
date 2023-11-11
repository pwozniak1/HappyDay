import SwiftUI

struct TodayErrorView: View {
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var viewModel: TodayViewModel
    let state: LoadAgainButtonErrorViewState

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            loadAgainButton(state: state)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.trailing, 24)
                .padding(.top, 16)

            if colorScheme == .light {
                Image.warningGlyph
                    .padding(.top, 40)
            } else {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 62, height: 58)
                        .foregroundColor(.white.opacity(0.5))
                    Image.warningGlyph
                }
                .padding(.top, 40)
            }

            VStack(alignment: .leading, spacing: 0) {
                Text(viewModel.todayErrorViewTitlePart1)
                    .kerning(-2.56)
                Text(viewModel.todayErrorViewTitlePart2)
                    .kerning(-2.56)
                    .padding(.top, -15)
                Text(viewModel.todayErrorViewTitlePart3)
                    .kerning(-2.56)
                    .padding(.top, -15)
            }
            .font(.interBoldSize64Weight700)
            .padding(.top, 40)

            Text(viewModel.todayErrorViewTextMessage)
                .font(.interMediumSize16Weight500)
                .padding(.top, 40)

            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.leading, 24)
        .background(
            GradientBackground(state: .redGradient, startPoint: $viewModel.startPoint, endPoint: $viewModel.endPoint)
                .onAppear {
                    viewModel.startAnimation()
                }
        )
    }

    func loadAgainButton(state: LoadAgainButtonErrorViewState) -> some View {
        Button {
            viewModel.loadAgainButtonErrorView(state: state)
        } label: {
            ZStack {
                Image.baseLoadAgainButton
                Image.loadAgainGlyph
            }
        }
    }
}

enum LoadAgainButtonErrorViewState {
    case today
    case forecast
}

struct TodayErrorView_Previews: PreviewProvider {
    static var previews: some View {
        TodayErrorView(viewModel: TodayViewModel(), state: .forecast)
    }
}
