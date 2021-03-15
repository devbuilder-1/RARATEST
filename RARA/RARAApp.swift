//
//  RARAApp.swift
//  RARA
//
//  Created by Prithiv Dev on 15/03/21.
//

import SwiftUI
import MagicSDK

@main
struct RARAApp: App {
    
    func magicAuth() -> Void {
        Magic.shared = Magic.init(apiKey: "pk_test_DB4AA78E1A5F5DD8")
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ViewRouter())
                .onAppear() {
                    self.magicAuth()
                }
        }
    }
}
