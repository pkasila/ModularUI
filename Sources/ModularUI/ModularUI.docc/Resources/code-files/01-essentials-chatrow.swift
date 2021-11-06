import SwiftUI

struct ChatRow: View {
    var chat: Chat
    
    var formatter: RelativeDateTimeFormatter {
        let f = RelativeDateTimeFormatter()
        f.dateTimeStyle = .numeric
        f.unitsStyle = .short
        return f
    }
    
    var body: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading) {
                Text(chat.title)
                    .font(.headline)
                Text(chat.lastMessage.text)
                    .font(.callout)
            }
            
            Spacer()
            
            Text(formatter.string(for: chat.lastMessage.date) ?? "UNK")
                .font(.caption)
        }
        .padding(.vertical, 4)
    }
}

struct ChatRow_Previews: PreviewProvider {
    static var previews: some View {
        ChatRow(chat: .init(id: 0, title: "Pavel Kasila", lastMessage: .init(id: 0, text: "Example test", date: Date())))
    }
}
