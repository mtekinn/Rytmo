import Foundation

class MainTimerViewModel: ObservableObject {
    @Published var remainingTime: TimeInterval
    var timer: Timer?
    
    init(routine: Routine) {
        self.remainingTime = routine.duration
    }
    
    func startTimer() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if self.remainingTime > 0 {
                self.remainingTime -= 1
            } else {
                self.timer?.invalidate()
            }
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
}
