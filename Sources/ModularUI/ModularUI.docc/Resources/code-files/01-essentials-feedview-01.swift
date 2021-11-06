import SwiftUI

struct FeedView: View {
    @State var items = FeedItem.sample
    
    var body: some View {
        List(items) { item in
            NavigationLink {
                PostView(item: item)
            } label: {
                FeedRow(item: item)
            }
        }
        .listStyle(InsetListStyle())
        .toolbar {
            Button {
                print("Clicked Create Post")
            } label: {
                Label {
                    Text("New Post")
                } icon: {
                    Image(systemName: "square.and.pencil")
                        .imageScale(.large)
                }

            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
