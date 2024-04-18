//
//  DisplaySettingView.swift
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
import Foundation

struct DisplaySettingView: View {
    @Binding var selectedColor:  Color
    @Binding var fontSelected: String
    @Environment(\.dismiss) var dismiss
    //var selectedColor = Color.blue
    var body: some View {
        NavigationView {
            VStack {
                Text("Select a Color for Icons")
                    .font(.headline)
                
                Picker("Select Color", selection: $selectedColor) {
                    Text("Blue").tag(Color.blue)
                    Text("Red").tag(Color.red)
                    Text("Green").tag(Color.green)
                    Text("Purple").tag(Color.purple)
                    Text("Orange").tag(Color.orange)
                }
                .pickerStyle(WheelPickerStyle())
                .padding()
                
                Spacer()
                Text("Select a Font size")
                    .font(.headline)
                
                Picker("Select Font", selection: $fontSelected) {
                    Text("Small")
                    Text("Normal")
                    Text("Large")
                    Text("Xlarge")
                }
                .pickerStyle(WheelPickerStyle())
                .padding()
                
                Spacer()
            }
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button{
                        dismiss()
                    } label: {
                        Label("Back", systemImage: "chevron.backward")
                            .labelStyle(.iconOnly)
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button{
                        //save
                        dismiss()
                    } label: {
                        Label("Save", systemImage: "checkmark")
                            .labelStyle(.iconOnly)
                    }
                }
            })
        }
    }
}

#Preview {
    DisplaySettingView(selectedColor: .constant(Color.blue), fontSelected: .constant("Normal"))
}
