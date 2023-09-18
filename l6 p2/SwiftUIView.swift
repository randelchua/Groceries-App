
import SwiftUI

struct Student: Identifiable {
    var id = UUID()
    var marks: Int
    var name: String
}

struct SwiftUIView: View {
    @State var bought = 0
    @State var isOn = false
    @State var itemName = ""
    @State var itemAmt = 1
    
    @State var persons: [Student] = [
        .init(marks: 17, name: "banana"),
        .init(marks: 5, name: "apples"),
        .init(marks: 92, name: "lettuce")
    ]
    
    var body: some View {
        VStack {
            Text("\(bought)")
            Stepper("Food bought already:", value: $bought)
                .padding()
            
            TextField("Item", text: $itemName)
                .padding()
            
            TextField("Quantity", value: $itemAmt, format: .number)
                .padding()
            
            Button("Add Item") {
                addItem()
            }
            
            List {
                ForEach(persons) { person in
                    Text("\(person.name) - I need \(person.marks).")
                        .contextMenu {
                          Button {
                                print("Copy")
                            } label: {
                                HStack {
                                    Text("Copy")
                                    Spacer()
                                    Image(systemName: "doc.on.doc")
                                }
                            }
                        }
                }
            }
        }
        .padding()
    }
    
    func addItem() {
        let newItem = Student(marks: itemAmt, name: itemName)
        persons.append(newItem)
        itemName = ""
        itemAmt = 0
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
