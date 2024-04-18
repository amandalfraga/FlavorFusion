//
//  NewRecipeView.swift
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

struct NewRecipeView: View {
    @StateObject var viewModel = NewRecipeViewModel()
    @ObservedObject private var authenticationViewModel = AuthenticationViewModel()
    @State private var presentingProfileScreen = false
    @Environment (\.dismiss) var dismiss
    
    enum Field {
        case name
        case description
        case category
        case ingredients
        case directions
    }
    
    @FocusState private var focusedField: Field?
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Name") {
                    TextField("Recipe Name", text: $viewModel.newRecipe.name)
                        .focused($focusedField, equals: .name)
                }
                Section("Description") {
                    TextField("", text: $viewModel.newRecipe.recipeDescription)
                        .focused($focusedField, equals: .description)
                }
                Section("Category") {
                    TextField("", text: $viewModel.newRecipe.category)
                        .focused($focusedField, equals: .category)
                }
                Section("Ingredients") {
                    TextField("", text: $viewModel.newRecipe.ingredients)
                        .focused($focusedField, equals: .ingredients)
                }
                Section("Directions") {
                    TextField("", text: $viewModel.newRecipe.directions)
                        .focused($focusedField, equals: .directions)
                }
                .toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button{
                        dismiss()
                    } label: {
                        Label("Cancel", systemImage: "xmark")
                            .labelStyle(.iconOnly)
                    }
                }
                    ToolbarItem {
                        Button{
                            //                            modelContext.insert(recipe)
                            //                            navigateToRecipe = true
                            dismiss()
                        } label: {
                            Label("Done", systemImage: "checkmark")
                                .labelStyle(.iconOnly)
                        }
                        // }
                        //.disabled(newRecipe.name.isEmpty)
                        
                    }
                })
                .navigationTitle("New Recipe")
                .navigationBarTitleDisplayMode(.inline)
            }
            .navigationViewStyle(.stack)
        }
        
        //                        Section("Make your favourites public?") {
        //                          Toggle(isOn: $viewModel.favourite.isPublic) {
        //                            Text("\(viewModel.favourite.isPublic ? "Yes" : "No")")
        //                          }
        //                        }
        //
        //        Button {
        //          viewModel.saveFavourite()
        //          focusedField = nil
        //        } label: {
        //          Text("Save")
        //            .frame(maxWidth: .infinity)
        //        }
        //        .buttonStyle(.blue)
        //        .listRowInsets(EdgeInsets())
        //      }
        //      .onAppear {
        //        viewModel.fetchFavourite()
        //      }
        //      .onDisappear {
        //        viewModel.saveFavourite()
        //      }
        //      .onSubmit {
        //        switch focusedField {
        //        case .movie:
        //          focusedField = .food
        //        case .food:
        //          focusedField = .city
        //        case .city:
        //          focusedField = .none
        //        default:
        //          print("Default")
        //        }
        //      }
        //      .listStyle(.plain)
        //      .toolbar {
        //        Button(action: { presentingProfileScreen.toggle() }) {
        //          Image(systemName: "person.circle")
        //        }
        //      }
        //      .sheet(isPresented: $presentingProfileScreen) {
        //        NavigationView {
        //          UserProfileView()
        //            .environmentObject(authenticationViewModel)
        //        }
        //      }
        //      .navigationTitle("My Favourites")
        //      .analyticsScreen(name: "\(MyFavouritesView.self)")
        //    }
        //  }
    }
}
        
#Preview {
    NewRecipeView()
}
