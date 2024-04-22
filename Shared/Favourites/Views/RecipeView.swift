//
//  RecipeView.swift
//  Flavor Fusion (iOS)
//
//  Created by Amanda Fraga on 4/22/24.
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

//import SwiftUI
//
//struct RecipeView: View {
//    var recipeDict: [nameof; desscription; category; directions; ingredients]
//    
//    
//    var body: some View {
//        recipeDict.name = "cake"
//        ScrollView {
////            let uimage = UIImage(data: recipe.image)
////            Image(uiImage: uimage!)
////                .resizable()
////                .aspectRatio(contentMode: .fill)
////            //}
////                .frame(height: 300)
////                .background(LinearGradient (gradient: Gradient(colors: [Color(.gray).opacity(0.3), Color(.gray)]), startPoint: .top, endPoint: .bottom))
//            VStack(spacing: 30) {
//                HStack{
//                    Text(recipeDict.name)
//                        .font (.largeTitle)
//                        .bold()
//                        .multilineTextAlignment(.center)
//                   
////                    Toggle("Toggle Button", isOn: $isToggled)
////                                .padding()
//                    
////                    FavoriteButton(isSet: $recipeModel.recipe[recipeIndex].isFavorite)
//                    
//                }
//                VStack(alignment: .leading, spacing: 30){
//                    if !recipe.recipeDescription.isEmpty {
//                        Text(recipe.recipeDescription)
//                    }
//                    if recipe.ingredients.isEmpty {
//                        VStack(alignment: .leading, spacing: 20) {
//                            Text ("Ingredients")
//                                .font(.headline)
//                            
//                            Text(recipe.ingredients)
//                        }
//                    }
//                    
//                    if !recipe.directions.isEmpty {
//                        VStack(alignment: .leading, spacing: 20) {
//                            Text("Directions")
//                                .font(.headline)
//                            
//                            Text(recipe.directions)
//                        }
//                    }
//                }
//                .frame(maxWidth: .infinity, alignment: .leading)
//            }
//            .padding(.horizontal)
//        }
//        .ignoresSafeArea(.container, edges: .top)
//    }
//}
//    
//    
////    #Preview {
////        RecipeView(recipe: Recipe.all[0])
////    }
