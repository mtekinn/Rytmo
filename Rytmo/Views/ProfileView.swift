import SwiftUI

struct ProfileView: View {
    @ObservedObject var viewModel: RoutinesListViewModel

    @State private var username: String = "User"
    @State private var notificationsEnabled: Bool = true

    var body: some View {
        Form {
            Section(header: Text("Profile")) {
                TextField("Username", text: $username)
            }

            Section(header: Text("Settings")) {
                Toggle("Enable Notifications", isOn: $notificationsEnabled)
            }
        }
        .navigationTitle("Profile")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Save") {
                    // Save user settings
                }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(viewModel: RoutinesListViewModel())
    }
}
