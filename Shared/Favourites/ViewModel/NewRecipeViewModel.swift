//
//  NewRecipeViewModel.swift
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
import Combine
import FirebaseAnalytics
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

@MainActor
class NewRecipeViewModel: ObservableObject {
  @Published var newRecipe = NewRecipe.empty

  @Published private var user: User?
  private var db = Firestore.firestore()
  private var cancellables = Set<AnyCancellable>()

  init() {
    registerAuthStateHandler()

    $user
      .compactMap { $0 }
      .sink { user in
        self.newRecipe.userId = user.uid
      }
      .store(in: &cancellables)
  }

  private var authStateHandler: AuthStateDidChangeListenerHandle?

  func registerAuthStateHandler() {
    if authStateHandler == nil {
      authStateHandler = Auth.auth().addStateDidChangeListener { auth, user in
        self.user = user
        self.fetchNewRecipe()
      }
    }
  }

  func fetchNewRecipe() {
    guard let uid = user?.uid else { return }
    Task {
      do {
        self.newRecipe  = try await db.collection("recipe").document(uid).getDocument(as: NewRecipe.self)
      }
      catch {
        print(error.localizedDescription)
      }
    }
  }

  func saveNewRecipe() {
    guard let documentId = user?.uid else { return }

    do {
      try db.collection("recipe").document(documentId).setData(from: newRecipe)
    }
    catch {
      print(error.localizedDescription)
    }
  }
}
