import SwiftUI

struct AddRoutineView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: RoutinesListViewModel

    @State private var name = ""
    @State private var duration: TimeInterval = 60

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Routine Details")) {
                    TextField("Routine Name", text: $name)
                    Picker("Duration", selection: $duration) {
                        ForEach(1..<121) { minute in
                            Text("\(minute) minutes").tag(TimeInterval(minute * 60))
                        }
                    }
                }
            }
            .navigationTitle("Add Routine")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        viewModel.addRoutine(name: name, duration: duration)
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
        }
    }
}

struct AddRoutineView_Previews: PreviewProvider {
    static var previews: some View {
        AddRoutineView(viewModel: RoutinesListViewModel())
    }
}
