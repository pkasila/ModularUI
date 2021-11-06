import Foundation
import SwiftUI
import ModularUI

class MessagesTabModule: TabModule {
    
    required init() {
        
    }
    
    var id: ID = "messages"
    var index = 1
    
    var title: Text = Text("Messages")
    
    func render() -> AnyView {
        return AnyView(MessagesView())
    }
    
    func label() -> Label<Text, Image> {
        return Label {
            Text("Messages")
        } icon: {
            Image(systemName: "text.bubble")
        }

    }
    
}
