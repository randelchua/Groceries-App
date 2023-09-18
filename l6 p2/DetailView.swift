import SwiftUI

struct People: Identifiable {
    var id = UUID()
    var marks: Int
    var name: String
}

struct DetailView: View {
    @State var bought = 0
    @State var itemName = ""
    @State var itemAmt = 1
    
    @State var peoples: [People] = [
        .init(marks: 37, name: "toilet paper"),
        .init(marks: 51, name: "soap"),
        .init(marks: 4252, name: "Detergent"),
        .init(marks: 1, name: "Car wheels")
    ]
    
    var body: some View {
        VStack {
            Text("\(bought)")
            Stepper("Utilities bought already:", value: $bought)
                .padding()
                    
            TextField("Item", text: $itemName)
                .padding()
            
            TextField("Quantity", value: $itemAmt, format: .number)
                .padding()
            Button(action: addItem) {
                Text("Add Item")
            }
            
            List {
                ForEach(peoples) { person in
                    Text("\(person.name) - I need \(person.marks)")
                }
            }
        }
        .padding()
    }
    
    func addItem() {
        let newItem = People(marks: itemAmt, name: itemName)
        peoples.append(newItem)
        
       itemName = ""
        itemAmt = 0
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}

