//
//  NewRecipe.swift
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

import Foundation
import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift

enum Category: String, CaseIterable, Identifiable{
    var id: String {self.rawValue}
    case breakfast = "Breakfast"
    case soup = "Soup"
    case salad = "Salad"
    case appetizer = "Appetizer"
    case main = "Main"
    case side = "Side"
    case dessert = "Dessert"
    case snack = "Snack"
    case drink = "Drink"
}

struct NewRecipe: Codable, Identifiable {
  @DocumentID var id: String?
    var isPublic: Bool

    var name: String
    //var image: Data
    var recipeDescription: String
    var ingredients: String
    var category: Category.RawValue
    var url: String
    var directions: String
    var isFavorite: Bool
    
    var userId: String
}

extension NewRecipe {
  static var empty: NewRecipe {
      NewRecipe(isPublic: false, name: "", recipeDescription: "" , ingredients: "", category: "", url: "", directions: "", isFavorite: false, userId: "")
  }
}
