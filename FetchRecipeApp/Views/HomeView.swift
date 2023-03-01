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
                                                      AsyncImage(url: URL(string: String(index.strMealThumb))) { image in
                                                            image
                                                                  .resizable()
                                                                  .scaledToFill()
                                                                  .frame(width: 50, height: 50, alignment: .center)
                                                                  .clipped()
                                                                  .cornerRadius(5)
                                                                  .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5), radius: 10, x: -5, y: 6)
                                                      } placeholder: {
                                                            ZStack {
                                                                  Rectangle()
                                                                        .foregroundColor(Color(UIColor.systemGray6))
                                                                        .frame(width: 50, height: 50, alignment: .center)
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
                .environmentObject(MealModel())
    }
}
