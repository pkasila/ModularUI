import SwiftUI

struct ChatView: View {
    var chat: Chat
    
    var body: some View {
        Text(chat.lastMessage.text)
            .navigationTitle(Text(chat.title))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button {
                    print("Clicked View Info")
                } label: {
                    Label {
                        Text("Information about the chat with \(chat.title)")
                    } icon: {
                        Image(systemName: "info.circle")
                            .imageScale(.large)
                    }

                }
            }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(chat: .init(id: 0, title: "Example Chat", lastMessage: .init(id: 0, text: "Something", date: Date())))
    }
}
