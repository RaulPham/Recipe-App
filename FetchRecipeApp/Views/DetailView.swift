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
            ScrollView {
                  GeometryReader { geo in
                        VStack(alignment: .leading) {
                              ForEach(mealDetailModel.dessertDetails.meals, id: \.idMeal) { index in
                                    VStack(alignment: .leading) {
                                          ZStack {
                                                ImageDetailView(model: index, width: geo.size.width, height: geo.size.height
                                                + 300)
                                                .cornerRadius(5)
                                                .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5), radius: 10, x: -5, y: 6)
                                          }
                                          
                                          Text(index.strCategory)
                                    }
                                    .navigationTitle(index.strMeal)
                              }
                        }
                  }
                  .padding([.leading, .trailing])
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
