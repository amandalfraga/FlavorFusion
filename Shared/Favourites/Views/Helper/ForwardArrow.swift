//
//  ForwardArrow.swift
//  Flavor Fusion (iOS)
//
//  Created by Camby Goff on 4/29/24.
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

struct ForwardArrow: View {
    @State var month: Int
    
    var body: some View {
        Button {
            withAnimation {
                month += 1
            }
        } label: {
            Image(systemName: "greaterthan")
                .resizable()
                .scaledToFill()
                .frame(width: 16, height: 28)
                .foregroundColor(.gray)
        }
    }
}

#Preview {
    ForwardArrow(month: 1)
}
