//
//  HomeView.swift
//  FetchRecipeApp
//
//  Created by Pham on 2/27/23.
//

import SwiftUI

struct HomeView: View {
      @EnvironmentObject var mealModel: MealModel
      
    var body: some View {
          NavigationView {
                List {
                      
                }
                .navigationTitle("List")
                .onAppear {
                      
                }
          }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
