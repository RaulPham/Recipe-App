//
//  DetailView.swift
//  FetchRecipeApp
//
//  Created by Pham on 2/28/23.
//

import SwiftUI

struct DetailView: View {
      @ObservedObject var mealDetailModel =  MealDetailModel()
      let mealId: String
      
    var body: some View {
          VStack {
                ForEach(mealDetailModel.dessertDetails.meals, id: \.self) { index in
                      Text(index.strMeal)
                }
          }
          .onAppear {
                mealDetailModel.getDessertDetail(detailId: mealId)
          }
    }
      
      
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(mealId: "")
    }
}
