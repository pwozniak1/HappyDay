import SwiftUI

public struct GradientBackground: View {
    var state: State
    @Binding var startPoint: CGFloat
    @Binding var endPoint: CGFloat
    @Environment(\.colorScheme) var colorScheme

    public var body: some View {
        switch state {
        case .blueGradient:
            LinearGradient(
                gradient: Gradient(colors: [
                    .customBlue,
                    colorScheme == .dark ? .black : .white,
                    colorScheme == .dark ? .black : .white,
                ]),
                startPoint: UnitPoint(x: startPoint, y: 0),
                endPoint: UnitPoint(x: endPoint, y: 1)
            )
            .ignoresSafeArea()

        case .yellowGradient:
            LinearGradient(
                gradient: Gradient(colors: [
                    .customYellow,
                    colorScheme == .dark ? .black : .white,
                    colorScheme == .dark ? .black : .white,
                ]),
                startPoint: UnitPoint(x: startPoint, y: 0),
                endPoint: UnitPoint(x: endPoint, y: 1)
            )
            .ignoresSafeArea()

        case .redGradient:
            LinearGradient(
                gradient: Gradient(colors: [
                    .customRed,
                    colorScheme == .dark ? .black : .white,
                    colorScheme == .dark ? .black : .white,
                ]),
                startPoint: UnitPoint(x: startPoint, y: 0),
                endPoint: UnitPoint(x: endPoint, y: 1)
            )
            .ignoresSafeArea()
        }
    }
}

extension GradientBackground {
    enum State {
        case blueGradient
        case yellowGradient
        case redGradient
    }
}

struct GradientBackground_Previews: PreviewProvider {
    static var previews: some View {
        GradientBackground(state: .yellowGradient, startPoint: .constant(0), endPoint: .constant(1))
    }
}
