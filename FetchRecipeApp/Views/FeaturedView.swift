//
//  FeaturedView.swift
//  FetchRecipeApp
//
//  Created by Pham on 3/1/23.
//

import SwiftUI

struct FeaturedView: View {
      @EnvironmentObject var model: MealModel
      @State var isDetailViewShowing = false
      @State var viewList = false
      @State var mealId: String = ""
      
    var body: some View {
          NavigationView {
                VStack(alignment: .leading) {
                      HStack {
                            Text("Features")
                                  .bold()
                                  .font(Font.custom("Avenir Heavy", size: 24))
                                  .padding(.leading)
                            
                            Spacer()
                            
                            NavigationLink(destination: ListView()) {
                                  Text("View all")
                                        .bold()
                                        .font(Font.custom("Avenir Heavy", size: 16))
                                        .padding(.trailing)
                            }
                      }
                      
                      GeometryReader { geo in
                            TabView {
                                  ForEach(model.dessert.meals.shuffled().prefix(5), id: \.idMeal) { dessert in
                                        Button {
                                              self.isDetailViewShowing = true
                                              self.mealId = dessert.idMeal
                                        } label: {
                                              ZStack {
                                                    Rectangle()
                                                          .foregroundColor(.white)
                                                    
                                                    VStack(spacing: 0) {
                                                          AsyncImage(url: URL(string: dessert.strMealThumb)) { image in
                                                                image
                                                                      .resizable()
                                                                      .aspectRatio(contentMode: .fill)
                                                                      .clipped()
                                                          } placeholder: {
                                                                Rectangle()
                                                          }
                                                          
                                                          Text(dessert.strMeal)
                                                                .font(Font.custom("Avenir", size: 15))
                                                                .padding(5)
                                                    }
                                              }
                                        }
                                        .buttonStyle(PlainButtonStyle())
                                        .frame(width: geo.size.width - 40, height: geo.size.height - 100, alignment: .center)
                                        .cornerRadius(15)
                                        .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5), radius: 10, x: -5, y: 6)
                                  }
                            }
                            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                      }
                }
                .sheet(isPresented: $isDetailViewShowing) {
                      DetailView(mealId: mealId)
                }
          }
    }
}

struct FeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedView()
    }
}
