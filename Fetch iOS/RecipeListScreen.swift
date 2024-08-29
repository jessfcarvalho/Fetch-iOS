//
//  ContentView.swift
//  Fetch iOS
//
//  Created by Jessica Carvalho on 8/27/24.
//

import SwiftUI

struct RecipeListScreen: View {
    
    // Create and manage NetworkManager
    @EnvironmentObject private var networkManager: NetworkManager
    
    // Adds 2 columns
    private let columns: [GridItem] = [
        GridItem(.flexible()), // First column
        GridItem(.flexible())  // Second column
    ]
    
    var body: some View {
        NavigationView { // For the title and navigation
            ScrollView { // To scroll through the grid
                // Create grid
                LazyVGrid(columns: columns) {
                    // Iterate through the array to create each meal tile
                    ForEach(networkManager.meals) { meal in
                        // NavigationLink for tapping the tile
                        NavigationLink(
                            destination: RecipeDetailScreen(mealID: meal.idMeal) // Navigate to detail view
                        ) {
                            RecipeTile(imageURL: URL(string: meal.strMealThumb)!, text: meal.strMeal, mealID: meal.idMeal
                            )
                        }
                    }
                }
            }
            .padding() // Padding around the scroll view
            .navigationTitle("Dessert Recipes")
            .onAppear {
                networkManager.fetchDesserts() // Fetch dessert recipes when view appears
            }
        }
    }
}

#Preview {
    RecipeListScreen()
        .environmentObject(NetworkManager())
}
