//
//  InfoView.swift
//  FetchRecipeApp
//
//  Created by Pham on 3/1/23.
//

import SwiftUI

struct InfoView: View {
      @ObservedObject var model = MealDetailModel()
      
    var body: some View {
          VStack {
                ForEach(model.extractIngredients(), id: \.self) { ingredients in
                     Text(ingredients)
                }
                ForEach(model.extractMeasures(), id: \.self) { measures in
                      Text(measures)
                }
          }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
          InfoView()
    }
}
