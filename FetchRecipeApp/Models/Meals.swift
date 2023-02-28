//
//  MealModel.swift
//  FetchRecipeApp
//
//  Created by Pham on 2/27/23.
//

import Foundation

struct Dessert: Decodable {
      //var id: UUID?
      var meals: [Meal]
}

struct Meal: Decodable {
      //var id: UUID?
      var strMeal: String
      var strMealThumb: String
      var idMeal: String
}
