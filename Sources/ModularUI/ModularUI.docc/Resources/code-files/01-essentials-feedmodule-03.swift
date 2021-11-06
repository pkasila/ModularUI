import Foundation
import SwiftUI
import ModularUI

class FeedTabModule: TabModule {
    
    required init() {
        
    }
    
    var id: ID = "feed"
    var index = 0
    
    var title: Text = Text("Feed")
    
    func render() -> AnyView {
        return AnyView(FeedView())
    }
    
    func label() -> Label<Text, Image> {
        return Label {
            Text("Feed")
        } icon: {
            Image(systemName: "newspaper")
        }

    }
    
}
