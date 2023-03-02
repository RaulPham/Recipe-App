//
//  ImageDetailView.swift
//  FetchRecipeApp
//
//  Created by Pham on 3/1/23.
//

import SwiftUI

struct ImageDetailView: View {
      var detail: Detail
      var width: Double
      var height: Double
      
    var body: some View {
          AsyncImage(url: URL(string: String(detail.strMealThumb))) { image in
                image
                      .resizable()
                      .scaledToFill()
                      .frame(width: width, height: height)
                      .clipped()
                      .cornerRadius(5)
          } placeholder: {
                ZStack {
                      Rectangle()
                            .foregroundColor(Color(UIColor.systemGray6))
                            .frame(width: width, height: height)
                            .cornerRadius(5)
                      
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

struct ImageDetailView_Previews: PreviewProvider {
    static var previews: some View {
          let model = MealDetailModel()
          ImageDetailView(detail: model.dessertDetails.meals[0], width: 50, height: 50)
    }
}
