//
//  File.swift
//  
//
//  Created by Pavel Kasila on 6.11.21.
//

import SwiftUI

struct FeedRow: View {
    var item: FeedItem
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(item.message)
                .font(.headline)
            Text("@\(item.username)")
                .font(.caption)
        }
        .padding(.vertical, 4)
    }
}

struct FeedRow_Previews: PreviewProvider {
    static var previews: some View {
        FeedRow(item: .init(id: 0, message: "Just messing around", username: "swiftuser"))
    }
}
