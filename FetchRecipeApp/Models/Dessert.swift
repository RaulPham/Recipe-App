//
//  MealModel.swift
//  FetchRecipeApp
//
//  Created by Pham on 2/27/23.
//

import Foundation

struct Dessert: Decodable {
      var meals: [Meal]
}

struct Meal: Hashable, Decodable {
      var strMeal: String
      var strMealThumb: String
      var idMeal: String
}
