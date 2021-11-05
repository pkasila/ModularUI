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
    #if os(iOS)
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    #endif

    public var body: some View {
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
        .onAppear(perform: self.setUp)
    }
    
    private var sidebar: some View {
        NavigationView {
            // The first column is the sidebar.
            List(registry.tabs, id: \.id) { tab in
                NavigationLink(destination: tab.render()
                                .navigationTitle(tab.title)) {
                    tab.label()
                }
            }
 
            // Initial content of the second column.
            EmptyView()
 
            // Initial content for the third column.
            Text("Select a category of settings in the sidebar.")
        }
        .onAppear(perform: self.setUp)
    }
    
    private func setUp() {
        Runtime.classes(conformTo: TabModule.Type.self).forEach { module in
            if let m = (module as? TabModule.Type) {
                Registry.shared.add(tabModule: m.init())
            } else {
                print("Failed to init \(module)")
            }
        }
    }
}
