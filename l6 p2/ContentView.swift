import SwiftUI

struct ContentView: View {
    @State var sheetShown = false
    @State var swiftUIviewOpen = false
    @State private var text: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Toggle("Show Utilities", isOn: $sheetShown)
                    .padding()
                    .sheet(isPresented: $sheetShown) {
                        DetailView()
                    }
                    .navigationTitle("Grocery list")
                Toggle("Show Food", isOn: $swiftUIviewOpen)
                    .padding()
                    .sheet(isPresented: $swiftUIviewOpen) {
                        SwiftUIView()
                    }
                    }
                }
            }
        }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
