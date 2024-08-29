//
//  Fetch_iOSApp.swift
//  Fetch iOS
//
//  Created by Jessica Carvalho on 8/27/24.
//

import SwiftUI

@main
struct Fetch_iOSApp: App {
    // Initialize the NetworkManager instance
    @StateObject private var networkManager = NetworkManager()

    var body: some Scene {
        WindowGroup {
            RecipeListScreen()
                .environmentObject(networkManager) // Provide the environment object to the view
        }
    }
}
