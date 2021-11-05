//
//  ModularView.swift
//
//
//  Created by Pavel Kasila on 5.11.21.
//

import Foundation
import SwiftUI

public struct ModularView: View {
    @ObservedObject private var registry: Registry
    
    public init() {
        self.registry = Registry.shared
    }
    
    @State private var tabId: String?
    
    public var body: some View {
        TabView(selection: $tabId) {
            ForEach(registry.tabs, id: \.id) { tab in
                NavigationView {
                    tab.render()
                        .navigationTitle(tab.title)
                }
                    .tabItem { tab.label() }
                    .tag(tab.id)
            }
        }.onAppear {
            Runtime.classes(conformTo: TabModule.self).forEach { module in
                Registry.shared.add(tabModule: module.init() as! TabModule)
            }
        }
    }
}
