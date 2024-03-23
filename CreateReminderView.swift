
import SwiftUI

struct CreateReminderView: View {
    @ObservedObject var viewModel: ReminderViewModel

    @State private var reminderTitle = ""
    @State private var selectedDateTime = Date()
    @State private var medicationNote = ""

    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Reminder Details")) {
                        TextField("Enter Reminder Title", text: $reminderTitle)
                        DatePicker("Select Date and Time", selection: $selectedDateTime, displayedComponents: [.date, .hourAndMinute])
                        TextField("Medication Note (Optional)", text: $medicationNote)
                    }
                }
                
                Button("Save Reminder") {
                    viewModel.addReminder(title: reminderTitle, dateTime: selectedDateTime, medicationNote: medicationNote.isEmpty ? nil : medicationNote)
                    clearForm()
                }
                .foregroundColor(.white)
                .padding()
                .background(Color.blue)
                .cornerRadius(10)
                .padding()
                
                Spacer()
            }
            .navigationTitle("Create Reminder")
        }
    }
    
    private func clearForm() {
        reminderTitle = ""
        selectedDateTime = Date()
        medicationNote = ""
    }
}
