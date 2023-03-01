//
//  DetailView.swift
//  FetchRecipeApp
//
//  Created by Pham on 2/28/23.
//

import SwiftUI

struct DetailView: View {
      let mealId: String
      
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
      
      func getDessertDetail() {
            let url = URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=\(mealId)")
      }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(mealId: "")
    }
}
