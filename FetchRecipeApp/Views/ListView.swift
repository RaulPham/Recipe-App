//
//  ListView.swift
//  FetchRecipeApp
//
//  Created by Pham on 2/27/23.
//

import SwiftUI

struct ListView: View {
      @EnvironmentObject var mealModel: MealModel
      @State var mealId: String = ""
      
    var body: some View {
          NavigationView {
                VStack(alignment: .leading) {
                      Text("All Recipes")
                            .bold()
                            .font(Font.custom("Avenir Heavy", size: 24))
                            .padding(.leading)
                      
                      ScrollView {
                            LazyVStack(alignment: .leading) {
                                  ForEach(mealModel.dessert.meals, id: \.idMeal) { index in
                                        NavigationLink(
                                          destination: DetailView(mealId: index.idMeal),
                                          label: {
                                                HStack(spacing: 20.0) {
                                                      ImageListView(model: index, width: 75, height: 75)
                                                      VStack(alignment: .leading) {
                                                            Text(index.strMeal)
                                                                  .foregroundColor(.black)
                                                                  .font(Font.custom("Avenir Heavy", size: 16))
                                                      }
                                                }
                                          })
                                  }
                            }
                            .padding(.leading)
                      }
                }
          }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
                .environmentObject(MealModel())
    }
}
