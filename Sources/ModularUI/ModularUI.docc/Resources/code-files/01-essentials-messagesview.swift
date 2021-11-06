import SwiftUI

struct MessagesView: View {
    @State var items = Chat.sample
    
    var body: some View {
        List(items) { item in
            NavigationLink {
                ChatView(chat: item)
            } label: {
                ChatRow(chat: item)
            }
        }
        .listStyle(InsetListStyle())
        .toolbar {
            Button {
                print("Clicked Create Chat")
            } label: {
                Label {
                    Text("New Chat")
                } icon: {
                    Image(systemName: "square.and.pencil")
                        .imageScale(.large)
                }

            }
        }
    }
}

struct MessagesView_Previews: PreviewProvider {
    static var previews: some View {
        MessagesView()
    }
}
