//
//  TouchdownApp.swift
//  Touchdown
//
//  Created by Camila Campana on 18/05/22.
//

import SwiftUI

@main
struct TouchdownApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(Shop())
        }
    }
}
