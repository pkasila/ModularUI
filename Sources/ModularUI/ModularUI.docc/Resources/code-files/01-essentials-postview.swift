import SwiftUI

struct PostView: View {
    var item: FeedItem
    
    var body: some View {
        Text(item.message)
            .navigationTitle(Text("Post by \(item.username)"))
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(item: .init(id: 0, message: "Just messing around", username: "swiftuser"))
    }
}
