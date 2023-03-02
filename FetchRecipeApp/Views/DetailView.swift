//
//  DetailView.swift
//  FetchRecipeApp
//
//  Created by Pham on 2/28/23.
//

import SwiftUI

struct DetailView: View {
      @ObservedObject var mealDetailModel = MealDetailModel()
      let mealId: String
      
      var body: some View {
            ScrollView {
                  VStack {
                        ForEach(mealDetailModel.dessertDetails.meals, id: \.idMeal) { detail in
                              ImageDetailView(detail: detail, width: 300, height: 300)
                                    .cornerRadius(5)
                                    .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5), radius: 10, x: -5, y: 6)

                              VStack(alignment: .leading) {
                                    Text(detail.strMeal)
                                          .bold()
                                          .font(Font.custom("Avenir Heavy", size: 24))
                                          .padding(.top, 20)
                                    
                                    Text(detail.strArea)
                                          .font(Font.custom("Avenir", size: 16))
                                    
                                    Divider()
                                    
                                    Text("Ingredients")
                                          .font(Font.custom("Avenir Heavy", size: 16))
                                          .padding([.bottom, .top], 5)
                                    
                                    ForEach(mealDetailModel.extractMeasuresAndIngredients(), id: \.1) { measure, ingredient in
                                          Text("• " + measure.lowercased() + " " + ingredient.lowercased())
                                                .font(Font.custom("Avenir", size: 15))
                                    }
                                    
                                    Divider()
                                    
                                    Text("Directions")
                                          .font(Font.custom("Avenir Heavy", size: 16))
                                          .padding([.bottom, .top], 5)
                                    
                                    VStack(alignment: .leading) {
                                          Text(detail.strInstructions)
                                                .font(Font.custom("Avenir", size: 15))
                                          
                                          Divider()
                                          
                                          Text("Video and Source")
                                                .font(Font.custom("Avenir Heavy", size: 16))
                                                .padding([.bottom, .top], 5)
                                          
                                          if let videoURLString = detail.strYoutube, let videoURL = URL(string: videoURLString) {
                                                Link(destination: videoURL) {
                                                      Text("Watch the video.")
                                                            .foregroundColor(.black)
                                                            .font(Font.custom("Avenir", size: 15))
                                                            .underline()
                                                }
                                          }
                                          
                                          if let source = detail.strSource, !source.isEmpty {
                                                Link(destination: URL(string: source)!) {
                                                      Text("Check out the source.")
                                                            .foregroundColor(.black)
                                                            .font(Font.custom("Avenir", size: 15))
                                                            .underline()
                                                }
                                          }
                                    }
                              }
                              .padding(.horizontal)
                              .navigationBarTitle(detail.strMeal)
                        }
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
