//
//  MealDetailModel.swift
//  FetchRecipeApp
//
//  Created by Pham on 2/28/23.
//

import Foundation

class MealDetailModel: ObservableObject {
      @Published var dessertDetails = DessertDetails(meals: [Detail(idMeal: "", strMeal: "", strCategory: "", strArea: "", strInstructions: "", strMealThumb: "", strYoutube: "", strIngredient1: "", strIngredient2: "", strIngredient3: "", strIngredient4: "", strIngredient5: "", strIngredient6: "", strIngredient7: "", strIngredient8: "", strIngredient9: "", strIngredient10: "", strIngredient11: "", strIngredient12: "", strIngredient13: "", strIngredient14: "", strIngredient15: "", strIngredient16: "", strIngredient17: "", strIngredient18: "", strIngredient19: "", strIngredient20: "", strMeasure1: "", strMeasure2: "", strMeasure3: "", strMeasure4: "", strMeasure5: "", strMeasure6: "", strMeasure7: "", strMeasure8: "", strMeasure9: "", strMeasure10: "", strMeasure11: "", strMeasure12: "", strMeasure13: "", strMeasure14: "", strMeasure15: "", strMeasure16: "", strMeasure17: "", strMeasure18: "", strMeasure19: "", strMeasure20: "", strSource: "")])
      let detailId: String = ""
      
      func getDessertDetail(detailId: String) {
            let url = URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=\(detailId)")
            
            guard url != nil else {
                  return
            }
            
            let task = URLSession.shared.dataTask(with: url!) { [weak self] data, _, error in
                  guard let data = data, error == nil else {
                        return
                  }
                  
                  do {
                        let jsonData = try JSONDecoder().decode(DessertDetails.self, from: data)
                        DispatchQueue.main.async {
                              self?.dessertDetails = jsonData
                        }
                  } catch {
                        print(error)
                  }
            }
            
            task.resume()
      }
      
      func extractMeasuresAndIngredients() -> [(String, String)] {
            var ingredients = [(String, String)]()
            let mirror = Mirror(reflecting: dessertDetails.meals[0])
            for case let (label?, value) in mirror.children {
                  if label.hasPrefix("strIngredient"), let ingredient = value as? String, validateString(str: ingredient) {
                        let measureLabel = label.replacingOccurrences(of: "strIngredient", with: "strMeasure")
                        if let measureValue = mirror.children.first(where: { $0.label == measureLabel })?.value as? String {
                              if !ingredients.contains(where: { $0.1 == ingredient }) {
                                    ingredients.append((measureValue, ingredient))
                              }
                        }
                  }
            }
            return ingredients
      }
      
      func validateString(str: String) -> Bool {
            if str.isEmpty {
                  return false
            } else if !str.isEmpty {
                  return true
            }
            
            return false
      }
}
