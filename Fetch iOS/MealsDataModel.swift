//
//  MealsDataModel.swift
//  Fetch iOS
//
//  Created by Jessica Carvalho on 8/27/24.
//

import Foundation

// Model to decode the top-level response from the API
struct MealResponse: Codable {
    let meals: [Meal] // Array of meals in the response
}

// Model to represent an individual meal
struct Meal: Codable, Identifiable {
    let idMeal: String // Unique identifier for the meal
    let strMeal: String // Name of the meal
    let strMealThumb: String // URL for the meals thumbnail image
    
    // Conform to Identifiable by providing a unique ID
    var id: String { idMeal }
}

// Model to decode the detailed meal from the API
struct MealDetailResponse: Codable {
    let meals: [MealDetail] // Array of meal details in the response
}

struct MealDetail: Codable, Identifiable {
    let idMeal: String
    let strMeal: String
    let strInstructions: String
    let strMealThumb: String
    
    // Define fields for ingredients and measures
    let strIngredient1: String?
    let strIngredient2: String?
    let strIngredient3: String?
    let strIngredient4: String?
    let strIngredient5: String?
    let strIngredient6: String?
    let strIngredient7: String?
    let strIngredient8: String?
    let strIngredient9: String?
    let strIngredient10: String?
    let strIngredient11: String?
    let strIngredient12: String?
    let strIngredient13: String?
    let strIngredient14: String?
    let strIngredient15: String?
    let strIngredient16: String?
    let strIngredient17: String?
    let strIngredient18: String?
    let strIngredient19: String?
    let strIngredient20: String?
    
    let strMeasure1: String?
    let strMeasure2: String?
    let strMeasure3: String?
    let strMeasure4: String?
    let strMeasure5: String?
    let strMeasure6: String?
    let strMeasure7: String?
    let strMeasure8: String?
    let strMeasure9: String?
    let strMeasure10: String?
    let strMeasure11: String?
    let strMeasure12: String?
    let strMeasure13: String?
    let strMeasure14: String?
    let strMeasure15: String?
    let strMeasure16: String?
    let strMeasure17: String?
    let strMeasure18: String?
    let strMeasure19: String?
    let strMeasure20: String?
    
    var id: String { idMeal }
    
    // List of ingrediants into array
    var ingredients: [String?] {
        return [
            strIngredient1,
            strIngredient2,
            strIngredient3,
            strIngredient4,
            strIngredient5,
            strIngredient6,
            strIngredient7,
            strIngredient8,
            strIngredient9,
            strIngredient10,
            strIngredient11,
            strIngredient12,
            strIngredient13,
            strIngredient14,
            strIngredient15,
            strIngredient16,
            strIngredient17,
            strIngredient18,
            strIngredient19,
            strIngredient20
        ].compactMap { $0 } // Remove nil values
    }
    
    // List of measurements into array
    var measures: [String?] {
        return [
            strMeasure1,
            strMeasure2,
            strMeasure3,
            strMeasure4,
            strMeasure5,
            strMeasure6,
            strMeasure7,
            strMeasure8,
            strMeasure9,
            strMeasure10,
            strMeasure11,
            strMeasure12,
            strMeasure13,
            strMeasure14,
            strMeasure15,
            strMeasure16,
            strMeasure17,
            strMeasure18,
            strMeasure19,
            strMeasure20
        ].compactMap { $0 } // Remove nil values
    }
}
