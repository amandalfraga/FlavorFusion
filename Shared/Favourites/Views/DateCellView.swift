//
//  DateCellView.swift
//  Flavor Fusion (iOS)
//
//  Created by Camby Goff on 5/1/24.
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

struct DateCellView: View {
    let value: CalendarDate
    @State var selectedDate: Date
    
    var body: some View {
        ZStack {
            if value.day != -1 {
                NavigationLink{
                    DayView()
                } label: {
                    Text("\(value.day)")
                        .foregroundStyle(.black)
                        .background {
                            ZStack (alignment: .bottom){
                                
                                if value.date.monthDayYearFormat() == Date().monthDayYearFormat() {
                                    
                                    Circle()
                                        .frame(width: 40,height: 60)
                                        .foregroundColor(.red.opacity(0.6))
                                    
                                    Circle()
                                        .frame(width: 8, height: 8)
                                        .foregroundStyle(.black)
                                }
                            }
                        }
                }
//                                    .disabled(value.day % 2 == 0)
            } else {
                Text("")
            }
        }
        .frame(width: 32, height: 32)    }
}

#Preview {
    DateCellView(value: CalendarDate(day: 1, date: Date()), selectedDate: Date())
}
