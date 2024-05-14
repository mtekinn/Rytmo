import SwiftUI

struct RoutineDetailView: View {
    @ObservedObject var viewModel: RoutinesListViewModel
    var routine: Routine

    var body: some View {
        VStack {
            Text(routine.name)
                .font(.largeTitle)
                .padding()

            Text("\(Int(routine.duration / 60)) minutes")
                .foregroundColor(.gray)
                .padding()

            Button(action: {
                viewModel.completeRoutine(routine)
            }) {
                Text("Complete Routine")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
            }

            Spacer()
        }
        .navigationTitle("Routine Details")
    }
}

struct RoutineDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RoutineDetailView(viewModel: RoutinesListViewModel(), routine: Routine(name: "Sample Routine", duration: 600))
    }
}
