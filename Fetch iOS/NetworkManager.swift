//
//  NetworkManager.swift
//  Fetch iOS
//
//  Created by Jessica Carvalho on 8/27/24.
//

import Foundation
import Combine

// NetworkManager class to handle fetching data from the MealDB API
class NetworkManager: ObservableObject {
    // Published property to notify views of updates to the meals data
    @Published var meals: [Meal] = []
    // Holds the detail of the selected meal
    @Published var selectedMeal: MealDetail?

    
    private let baseURL = "https://www.themealdb.com/api/json/v1/1/"
    
    // Function to fetch dessert recipes from the API
    func fetchDesserts() {
        let urlString = baseURL + "filter.php?c=Dessert" // Endpoint to filter by category 'Dessert'
        guard let url = URL(string: urlString) else { return } // Safely unwrap URL
        
        // Perform the network request
        URLSession.shared.dataTask(with: url) { data, response, error in
            // Check if data is received
            if let data = data {
                do {
                    // Decode the JSON response into MealResponse object
                    let response = try JSONDecoder().decode(MealResponse.self, from: data)
                    // Update the published meals property on the main thread
                    DispatchQueue.main.async {
                        self.meals = response.meals
                    }
                } catch {
                    print("Error decoding data: \(error)") // Print error if decoding fails
                }
            }
        }.resume() // Start the network request
    }
    
    func fetchMealDetail(mealID: String) {
        let urlString = baseURL + "lookup.php?i=\(mealID)"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let response = try JSONDecoder().decode(MealDetailResponse.self, from: data)
                    DispatchQueue.main.async {
                        self.selectedMeal = response.meals.first
                    }
                } catch {
                    print("Error decoding data: \(error)")
                }
            }
        }.resume()
    }
    
}


