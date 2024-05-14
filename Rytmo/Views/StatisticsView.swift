import SwiftUI
import Charts

struct StatisticsView: View {
    @ObservedObject var viewModel: RoutinesListViewModel

    var body: some View {
        VStack {
            Text("Routine Completion Statistics")
                .font(.headline)
                .padding()

            Chart(viewModel.completedRoutines.keys.sorted(), id: \.self) { routine in
                BarMark(
                    x: .value("Routine", routine.name),
                    y: .value("Completion Count", viewModel.completedRoutines[routine] ?? 0)
                )
                .foregroundStyle(by: .value("Routine", routine.name))
            }
            .frame(height: 300)
            .padding()

            Spacer()
        }
        .navigationTitle("Statistics")
    }
}

struct StatisticsView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsView(viewModel: RoutinesListViewModel())
    }
}
