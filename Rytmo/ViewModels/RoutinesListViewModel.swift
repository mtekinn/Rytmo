import Foundation
import UserNotifications

class RoutinesListViewModel: ObservableObject {
    @Published var routines: [Routine] = [
        Routine(name: "Morning Exercise", duration: 1800),
        Routine(name: "Work", duration: 28800),
        Routine(name: "Lunch", duration: 3600)
    ]
    
    @Published var completedRoutines: [Routine: Int] = [:]

    func scheduleNotification(for routine: Routine) {
        let content = UNMutableNotificationContent()
        content.title = "Routine Reminder"
        content.body = "It's time for your \(routine.name) routine!"
        content.sound = .default

        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: routine.duration, repeats: false)

        let request = UNNotificationRequest(identifier: routine.id.uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error scheduling notification: \(error.localizedDescription)")
            }
        }
    }

    func addRoutine(name: String, duration: TimeInterval) {
        let newRoutine = Routine(name: name, duration: duration)
        routines.append(newRoutine)
        scheduleNotification(for: newRoutine)
    }

    func completeRoutine(_ routine: Routine) {
        if let count = completedRoutines[routine] {
            completedRoutines[routine] = count + 1
        } else {
            completedRoutines[routine] = 1
        }
    }
}
