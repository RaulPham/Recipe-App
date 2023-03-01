//
//  MealModel.swift
//  FetchRecipeApp
//
//  Created by Pham on 2/27/23.
//

import Foundation

class MealModel: ObservableObject {
      @Published var dessert = Dessert(meals: [Meal(strMeal: "", strMealThumb: "", idMeal: "")])
      //@Published var idMeal: String
      
      init() {
            getDessert()
            //storeMealId()
      }
      
      func getDessert() {
            let url = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert")
            
            guard url != nil else {
                  return
            }
            
            let task = URLSession.shared.dataTask(with: url!) { [weak self] data, _, error in
                  guard let data = data, error == nil else {
                        return
                  }
                  
                  do {
                        let jsonData = try JSONDecoder().decode(Dessert.self, from: data)
                        DispatchQueue.main.async {
                              self?.dessert = jsonData
                        }
                  } catch {
                        print(error)
                  }
            }
            
            task.resume()
      }
      
      func storeMealId() {
            
      }
      
      /*
      func getDessertDetail() {
            var mealId: String
            
            for id in idMeal {
                  
            }
            
            let url = URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=MEAL_ID")
            
            guard url != nil else {
                  return
            }
            
            let task = URLSession.shared.dataTask(with: url!) { [weak self] data, _, error in
                  guard let data = data, error == nil else {
                        return
                  }
                  
                  do {
                        let jsonData = try JSONDecoder().decode(Dessert.self, from: data)
                        DispatchQueue.main.async {
                              self?.dessert = jsonData
                        }
                  } catch {
                        print(error)
                  }
            }
            
            task.resume()
      }
       */
}
