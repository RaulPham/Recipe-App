//
//  HomeView.swift
//  FetchRecipeApp
//
//  Created by Pham on 2/27/23.
//

import SwiftUI

struct HomeView: View {
      @EnvironmentObject var mealModel: MealModel
      @State var mealId: String = ""
      
    var body: some View {
          NavigationView {
                ScrollView {
                        ForEach(mealModel.dessert.meals, id: \.idMeal) { index in
                              NavigationLink(destination: DetailView(mealId: index.idMeal)) {
                                    Text(index.strMeal)
                              }
                        }
                }
          }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
