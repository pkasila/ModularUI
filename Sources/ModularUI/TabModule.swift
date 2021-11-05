//
//  TabModule.swift
//  
//
//  Created by Pavel Kasila on 5.11.21.
//

import Foundation
import SwiftUI

public protocol TabModule {
    typealias ID = String
    var id: ID { get }
    
    var title: Text { get }
    
    func render() -> AnyView
    func label() -> Label<Text, Image>
}
