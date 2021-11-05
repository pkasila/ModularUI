//
//  TabModule.swift
//  
//
//  Created by Pavel Kasila on 5.11.21.
//

import Foundation
import SwiftUI

/// A protocol to which your modules should conform if you want them to be accessible through ``ModularView``
public protocol TabModule {
    /// Basic initializer to create an instance of your module by ModularView
    init()
    
    typealias ID = String
    
    /// Unique identificator of the module, **MUST** be unique
    var id: ID { get }
    /// Index at which your module should be in ``ModularView``'s Sidebar or TabBar
    var index: Int { get }
    
    /// Title which will be displayed as navigation title
    var title: Text { get }
    
    /// Called by ``ModularView`` to get the module's main view
    /// - Returns: the view to be rendered
    func render() -> AnyView
    
    /// Called by ``ModularView`` to get label to be shown in Sidebar or TabBar
    /// - Returns: the label to be shown
    func label() -> Label<Text, Image>
}
