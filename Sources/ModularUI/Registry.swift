//
//  Registry.swift
//  
//
//  Created by Pavel Kasila on 5.11.21.
//

import Foundation

public class Registry: ObservableObject {
    @Published private(set) var tabs = [TabModule]()
    
    public func add(tabModule: TabModule) {
        self.tabs.append(tabModule)
        self.tabs.sort { $0.index < $1.index }
    }
    
    public static let shared = Registry()
}
