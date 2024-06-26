//
//  RootContentView.swift
//  Favourites (iOS)
//
//  Created by Peter Friese on 24.11.22.
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

struct RootContentView: View {
  var body: some View {
    TabView {
      MyFavouritesView()
        .tabItem {
          Label("My Recipes", systemImage: "book.pages.fill")
        }
      FavouritesListView()
        .tabItem {
          Label("Favorites", systemImage: "heart")
        }
      FavouritesListView2()
        .tabItem {
          Label("Calender", systemImage: "calendar")
        }
      FavouritesListView()
        .tabItem {
          Label("Social", systemImage: "person.3.fill")
        }
      SettingsView()
        .tabItem {
          Label("Settings", systemImage: "gear")
        }
    }
  }
}

struct RootContentView_Previews: PreviewProvider {
  static var previews: some View {
    RootContentView()
  }
}
