import SwiftUI

struct MainTimerView: View {
    @ObservedObject var viewModel: MainTimerViewModel
    
    init(routine: Routine) {
        viewModel = MainTimerViewModel(routine: routine)
    }
    
    var body: some View {
        VStack {
            CircularProgressView(progress: viewModel.remainingTime, totalDuration: viewModel.remainingTime)
            Text("\(Int(viewModel.remainingTime)) seconds remaining")
            HStack {
                Button("Start") {
                    viewModel.startTimer()
                }
                Button("Stop") {
                    viewModel.stopTimer()
                }
            }
        }
        .navigationTitle("Timer")
    }
}

struct MainTimerView_Previews: PreviewProvider {
    static var previews: some View {
        MainTimerView(routine: Routine(name: "Sample Routine", duration: 600))
    }
}
