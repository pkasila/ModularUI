import Foundation

struct FeedItem: Identifiable {
    var id: Int
    var message: String
    var username: String
    
    static let sample: [FeedItem] = [
        .init(id: 0, message: "Just playing around", username: "pavelkasila"),
        .init(id: 1, message: "Simply testing ModularUI", username: "pavelkasila"),
    ]
}
