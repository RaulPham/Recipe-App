//
//  ImageListView.swift
//  FetchRecipeApp
//
//  Created by Pham on 3/1/23.
//

import SwiftUI

struct ImageListView: View {
      var model: Meal
      var width: Double
      var height: Double
      
    var body: some View {
          AsyncImage(url: URL(string: String(model.strMealThumb))) { image in
                image
                      .resizable()
                      .scaledToFill()
                      .frame(width: width, height: height)
                      .clipped()
                      .cornerRadius(5)
                      .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5), radius: 10, x: -5, y: 6)
          } placeholder: {
                ZStack {
                      Rectangle()
                            .foregroundColor(Color(UIColor.systemGray6))
                            .frame(width: width, height: height)
                            .cornerRadius(5)
                            .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5), radius: 10, x: -5, y: 6)
                      
                      VStack {
                            ProgressView(value: 1.0)
                                  .progressViewStyle(CircularProgressViewStyle())
                            
                            Text("Image Loading")
                                  .foregroundColor(.black)
                                  .font(Font.custom("Avenir Heavy", size: 6))
                      }
                }
          }
    }
}

struct ImageListView_Previews: PreviewProvider {
    static var previews: some View {
          let model = MealModel()
          ImageListView(model: model.dessert.meals[0], width: 50.0, height: 50.0)
    }
}
