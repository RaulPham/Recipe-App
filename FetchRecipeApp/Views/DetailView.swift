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
                                                Rectangle()
                                                      .foregroundColor(.white)
                                                      .frame(width: geo.size.width, height: geo.size.height + 200, alignment: .center)
                                                      .cornerRadius(5)
                                                      .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5), radius: 10, x: -5, y: 6)
                                                
                                                AsyncImage(url: URL(string: String(index.strMealThumb))) { image in
                                                      image
                                                            .resizable()
                                                            .scaledToFill()
                                                            .frame(width: geo.size.width, height: geo.size.height + 200, alignment: .center)
                                                            .clipped()
                                                            .cornerRadius(5)
                                                } placeholder: {
                                                      ZStack {
                                                            Rectangle()
                                                                  .foregroundColor(Color(UIColor.systemGray6))
                                                                  .frame(width: geo.size.width, height: geo.size.height + 200, alignment: .center)
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
