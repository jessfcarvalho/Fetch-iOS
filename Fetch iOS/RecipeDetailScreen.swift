//
//  RecipeDetailScreen.swift
//  Fetch iOS
//
//  Created by Jessica Carvalho on 8/27/24.
//

import SwiftUI

struct RecipeDetailScreen: View {
    @EnvironmentObject private var networkManager: NetworkManager
    let mealID: String
    
    var body: some View {
        VStack {
            if let meal = networkManager.selectedMeal {
                ScrollView {
                    VStack(alignment: .leading) {
                        
                        // Dessert Name
                        Text(meal.strMeal)
                            .font(.title)
                            .bold()
                            .padding(.bottom, 10)
                        
                        // Dessert Image
                        AsyncImage(url: URL(string: meal.strMealThumb)) { image in
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(height: 200)
                        } placeholder: {
                            ProgressView()
                                .frame(height: 200)
                        }
                        
                        // Dessert ingredients header / content
                        Text("Ingredients")
                            .font(.system(size: 21))
                            .bold()
                            .padding(.bottom, 5)
                            .padding(.top, 5)
                        
                        // Shows all ingredients and measures for dessert
                        ForEach(Array(zip(meal.ingredients, meal.measures)), id: \.0) { ingredient, measure in
                            // Checks if the ingredient is not nil and not empty
                            if let ingredient = ingredient, !ingredient.isEmpty {
                                // If the measure is not nil and not empty, display ingredient with measure
                                if let measure = measure, !measure.isEmpty {
                                    Text("\(ingredient) - \(measure)")
                                        .font(.body)
                                } else {
                                    // If measure is nil or empty, display only the ingredient
                                    Text(ingredient)
                                        .font(.body)
                                }
                            }
                        }
                        
                        // Dessert instructions header / content
                        Text("Instructions")
                            .font(.system(size: 21))
                            .bold()
                            .padding(.bottom, 5)
                            .padding(.top, 5)
                        
                        Text(meal.strInstructions)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    .padding()
                }
            } else {
                ProgressView() // Shows loading
            }
        }
        .navigationTitle("Recipe Details")
        .onAppear {
            networkManager.fetchMealDetail(mealID: mealID) // Gets meal details
        }
    }
}

#Preview {
    RecipeDetailScreen(mealID: "52776")
        .environmentObject(NetworkManager()) // Provide a preview environment object
}
