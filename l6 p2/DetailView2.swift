

import SwiftUI

struct person:Identifiable{
    var id = UUID()
    var marks: Int
    var name: String
}

struct detailView2: View {
    @State var personss: [persons] = [
        .init(
            marks: 17,
            name: "ksajfnfosa"
         ),
        .init(
            marks: 5,
            name: "dsaoij" ),
        .init(
            marks: 92,
            name: "Johnny" ),
        .init(
            marks: 53,
            name: "John")
    ]
    
    var body: some View {
        List{
            ForEach(personss, id: \.id) { persons in
                Text("My name is \(persons.name) and i got \(persons.marks) out of 100 for Math")
            }
        }
    }
}

struct detailView2_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
