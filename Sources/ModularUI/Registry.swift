//
//  Registry.swift
//  
//
//  Created by Pavel Kasila on 5.11.21.
//

import Foundation

class Registry: ObservableObject {
    @Published private(set) var tabs = [TabModule]()
    private(set) var initiazlied = false
    
    func add(tabModule: TabModule) {
        self.tabs.append(tabModule)
        self.tabs.sort { $0.index < $1.index }
        self.initiazlied = true
    }
    
    static let shared = Registry()
}
