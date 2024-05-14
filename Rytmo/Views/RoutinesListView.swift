import SwiftUI

struct RoutinesListView: View {
    @ObservedObject var viewModel: RoutinesListViewModel

    @State private var showingAddRoutine = false

    var body: some View {
        NavigationView {
            List(viewModel.routines) { routine in
                NavigationLink(destination: RoutineDetailView(viewModel: viewModel, routine: routine)) {
                    HStack {
                        Text(routine.name)
                        Spacer()
                        Text("\(Int(routine.duration / 60)) min")
                            .foregroundColor(.gray)
                    }
                }
            }
            .navigationTitle("Routines")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showingAddRoutine.toggle()
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddRoutine) {
                AddRoutineView(viewModel: viewModel)
            }
        }
    }
}

struct RoutinesListView_Previews: PreviewProvider {
    static var previews: some View {
        RoutinesListView(viewModel: RoutinesListViewModel())
    }
}
