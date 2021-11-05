//
//  ModularView.swift
//
//
//  Created by Pavel Kasila on 5.11.21.
//

import Foundation
import SwiftUI

/// Main view which is used to access all modules
public struct ModularView: View {
    @ObservedObject private var registry: Registry
    
    public init() {
        self.registry = Registry.shared
    }
    
    @State private var tabId: String?
    #if os(iOS)
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    #endif

    public var body: some View {
        Group {
            #if os(iOS)
            if horizontalSizeClass == .compact {
                tabbed
            } else {
                sidebar
            }
            #else
            sidebar
            #endif
        }
        .onAppear(perform: self.setUp)
    }
    
    private var tabbed: some View {
        TabView(selection: $tabId) {
            ForEach(registry.tabs, id: \.id) { tab in
                NavigationView {
                    tab.render()
                        .navigationTitle(tab.title)
                }
                    .tabItem { tab.label() }
                    .tag(tab.id)
            }
        }
    }
    
    private var sidebar: some View {
        NavigationView {
            // The first column is the sidebar.
            List(registry.tabs, id: \.id, selection: $tabId) { tab in
                NavigationLink(tag: tab.id, selection: $tabId) {
                    tab.render()
                        .navigationTitle(tab.title)
                } label: {
                    tab.label()
                }
            }
            .listStyle(SidebarListStyle())
 
            // Initial content of the second column.
            if let tab = registry.tabs.first(where: { $0.id == self.tabId }) {
                tab.render()
                    .navigationTitle(tab.title)
            } else {
                EmptyView()
            }
 
            // Initial content for the third column.
            Text("Select a category of settings in the sidebar.")
        }
    }
    
    private func setUp() {
        Runtime.classes(conformTo: TabModule.Type.self).forEach { module in
            if let m = (module as? TabModule.Type) {
                Registry.shared.add(tabModule: m.init())
            } else {
                print("Failed to init \(module)")
            }
        }
        
        // Setup selected tab
        
        if self.tabId == nil {
            if self.registry.tabs.count > 0 {
                self.tabId = self.registry.tabs[0].id
            }
        }
    }
}
