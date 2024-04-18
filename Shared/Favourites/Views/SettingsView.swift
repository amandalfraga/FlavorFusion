//
//  SettingsView.swift
//  Flavor Fusion
//
//  Created by Amanda Fraga on 4/18/24.
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


struct SettingsView: View {
    @ObservedObject private var authenticationViewModel = AuthenticationViewModel()
    @State private var presentingProfileScreen = false
    @State private var displaySettingScreen = false
    
    var body: some View {
        NavigationView {
            VStack{
                Button(action: { presentingProfileScreen.toggle() }) {
                    Text("Profile")
                        .font(.system(size: 20))
                }
                .sheet(isPresented: $presentingProfileScreen) {
                    NavigationView {
                        UserProfileView()
                            .environmentObject(authenticationViewModel)
                    }
                }
                Button(action: { displaySettingScreen.toggle() }){
                    Text("Display")
                        .font(.system(size: 20))
                }
                .sheet(isPresented: $displaySettingScreen) {
                    NavigationView{
                        DisplaySettingView(selectedColor: .constant(Color.blue), fontSelected: .constant("Normal"))
                    }
                }
            }
            .navigationBarTitle("Settings")
        }
    }
}

#Preview {
    SettingsView()
}
