//
//  MealModel.swift
//  FetchRecipeApp
//
//  Created by Pham on 2/27/23.
//

import Foundation

class MealModel: ObservableObject {
      
      init() {
            getLocalData()
      }
      
      func getLocalData() {
            let jsonUrl = Bundle.main.url(forResource: "Dessert", withExtension: "json")
            
            do {
                  let jsonData = try Data(contentsOf: jsonUrl!)
                  
                  let jsonDecoder = JSONDecoder()
                  
                 let mealModel = try jsonDecoder.decode(Dessert.self, from: jsonData)
                  
                  print(mealModel)
                  
            } catch {
                  print(error)
            }
      }
}
