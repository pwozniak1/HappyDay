import SwiftUI

struct EnableLocationView: View {
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var viewModel: TodayViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            VStack(alignment: .leading, spacing: 0) {
                Text(viewModel.enableLocationViewTitlePart1)
                    .kerning(-2.56)
                Text(viewModel.enableLocationViewTitlePart2)
                    .kerning(-2.56)
                    .padding(.top, -15)
            }
            .padding(.top, 40)

            Text(viewModel.enableLocationViewTextMessage)
                .padding(.top, 40)

            enableLocationButton
                .padding(.top, 40)

            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.leading, 24)
    }

    var enableLocationButton: some View {
        Button {
            viewModel.requestLocation()
        } label: {
            Text(viewModel.enableLocationViewButtonTitle)
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
