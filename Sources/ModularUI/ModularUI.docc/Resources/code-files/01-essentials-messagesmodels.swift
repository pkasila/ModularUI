import Foundation

struct Chat: Identifiable {
    var id: Int
    
    var title: String
    var lastMessage: Message
    
    static let sample: [Chat] = [
        .init(id: 1, title: "Pavel Kasila", lastMessage: .init(id: 0, text: "Hey, check this out", date: Date().addingTimeInterval(-1000))),
        .init(id: 2, title: "Elon Musk", lastMessage: .init(id: 0, text: "Wow, that's super cool!", date: Date().addingTimeInterval(-2000))),
        .init(id: 3, title: "Craig Federighi", lastMessage: .init(id: 0, text: "Why you call me a superman?", date: Date().addingTimeInterval(-3000)))
    ]
}

struct Message: Identifiable {
    var id: Int
    var text: String
    var date: Date
}
