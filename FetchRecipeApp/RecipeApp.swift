//
//  RecipeApp.swift
//  FetchRecipeApp
//
//  Created by Pham on 2/27/23.
//

import SwiftUI

@main
struct RecipeApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                    .environmentObject(MealModel())
        }
    }
}
