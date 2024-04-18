//
//  MyRecipe.swift
//  Flavor Fusion
//
//  Created by Amanda Fraga on 4/17/24.
//  Copyright © 2021 Google LLC. All rights reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.


import SwiftUI
import Combine
import FirebaseAnalytics
import FirebaseAnalyticsSwift

struct MyRecipe: View {
    //@StateObject var viewModel = MyRecipesViewModel()
    @ObservedObject private var authenticationViewModel = AuthenticationViewModel()
    @State private var presentingProfileScreen = false
    
    var body: some View {
        NavigationView{
            ScrollView{
            }
            .toolbar {
                Button(action: { presentingProfileScreen.toggle() }) {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $presentingProfileScreen) {
                NavigationView {
                    NewRecipeView()
                        .environmentObject(authenticationViewModel)
                }
            }
            .navigationTitle("My Recipes")
            //.analyticsScreen(name: "\(MyFavouritesView.self)")
        }
    }
}

#Preview {
    MyRecipe()
}
