import SwiftUI

struct CircularProgressView: View {
    var progress: TimeInterval
    var totalDuration: TimeInterval
    
    var body: some View {
        Circle()
            .trim(from: 0, to: CGFloat(progress / totalDuration))
            .stroke(Color.blue, lineWidth: 5)
            .rotationEffect(.degrees(-90))
            .frame(width: 100, height: 100)
    }
}

struct CircularProgressView_Previews: PreviewProvider {
    static var previews: some View {
        CircularProgressView(progress: 5, totalDuration: 10)
    }
}
