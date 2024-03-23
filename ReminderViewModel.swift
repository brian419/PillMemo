
import Foundation

struct Reminder: Identifiable {
    var id: UUID = UUID()
    var title: String
    var dateTime: Date
    var medicationNote: String?
    
    var dateTimeString: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: dateTime)
    }
}

class ReminderViewModel: ObservableObject {
    @Published var reminders: [Reminder] = []
    
    func addReminder(title: String, dateTime: Date, medicationNote: String?) {
        let newReminder = Reminder(title: title, dateTime: dateTime, medicationNote: medicationNote)
        reminders.append(newReminder)
    }
}
