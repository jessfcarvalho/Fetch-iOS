//
//  RecipeTile.swift
//  Fetch iOS
//
//  Created by Jessica Carvalho on 8/27/24.
//

import SwiftUI

struct RecipeTile: View {
    let imageURL: URL
    let text: String
    let mealID: String

    var body: some View {
        VStack {
            // Dessert image
            AsyncImage(url: imageURL) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }
            .frame(height: 150)

            // Dessert name
            Text(text)
                .bold()
                .foregroundColor(.black)
                .font(.system(size: 14))
                .padding(.top, 5)
        }
        .frame(height: 200)
        .background(
            NavigationLink(destination: RecipeDetailScreen(mealID: mealID)) {
                EmptyView() // Invisible NavigationLink
            }
            .opacity(0) // Hide the NavigationLink (still functins)
        )
    }
}

#Preview {
    RecipeTile(imageURL: URL(string: "https://www.themealdb.com/images/media/meals/tqtywx1468317395.jpg")!, text: "Chocolate Gateau", mealID: "52776")
}
