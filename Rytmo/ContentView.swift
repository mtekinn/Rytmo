import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = RoutinesListViewModel()

    var body: some View {
        TabView {
            RoutinesListView(viewModel: viewModel)
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Routines")
                }

            StatisticsView(viewModel: viewModel)
                .tabItem {
                    Image(systemName: "chart.bar")
                    Text("Statistics")
                }

            ProfileView(viewModel: viewModel)
                .tabItem {
                    Image(systemName: "person.circle")
                    Text("Profile")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
