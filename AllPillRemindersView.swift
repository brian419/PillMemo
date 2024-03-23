
import SwiftUI

struct AllPillRemindersView: View {
    @ObservedObject var viewModel: ReminderViewModel

    var body: some View {
        NavigationView {
            List(viewModel.reminders) { reminder in
                VStack(alignment: .leading) {
                    Text(reminder.title)
                        .font(.headline)
                    Text(reminder.dateTimeString)
                        .font(.subheadline)
                    if let note = reminder.medicationNote {
                        Text("Medication Note: \(note)")
                    }
                }
            }
            .navigationTitle("All Reminders")
        }
    }
}
