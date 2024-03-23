import SwiftUI

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView: View {
    @StateObject var viewModel = ReminderViewModel()

    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: CreateReminderView(viewModel: viewModel)) {
                    Text("Create Reminder")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding()

                NavigationLink(destination: AllPillRemindersView(viewModel: viewModel)) {
                    Text("View Reminders")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(10)
                }
                .padding()

                Spacer()
            }
            .navigationTitle("Pill Memo")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
