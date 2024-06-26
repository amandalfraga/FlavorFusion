//
//  DayView.swift
//  Flavor Fusion (iOS)
//
//  Created by Camby Goff on 4/25/24.
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

struct DayView: View {
    @State private var dates = [ 
        Date(),
        Calendar.current.date(byAdding: .hour, value: 1,
                              to: Date())!,
        Calendar.current.date(byAdding: .hour, value: 3,
                              to: Date())!,
        Calendar.current.date(byAdding: .hour, value: 5,
                              to: Date())!,
        Calendar.current.date(byAdding: .hour, value: 7,
                              to: Date())!,
//        Calendar.current.date(bySettingHour: 7, minute: 0, second: 0, of: Date())
        
    ]
    @State var selectedDate: Date?
    
    var body: some View {
        
        ScrollView {
            Text("April 25, 2024")
            
            Divider()
            
            Text("Select a Time")
                .font(.largeTitle)
                .bold()
            
            Text("Meals")
            
            ForEach(dates, id: \.self) { date in
                HStack {
                    Button{
                        withAnimation{
                            selectedDate = date
                        }
                    } label: {
                        Text(date.timeFromDate())
                            .bold()
                            .padding()
                            .frame(maxWidth: .infinity)
                            .foregroundColor(selectedDate == date ? .white : .blue)
                            .background(
                                ZStack{
                                    if selectedDate == date {
                                        RoundedRectangle(cornerRadius: 10)
                                            .foregroundColor(.gray)
                                    } else {
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke()
                                    }
                                }
                            )
                    }
                    if selectedDate == date {
                        NavigationLink{
                            EmptyView()
                        } label: {
                            Text("Next")
                                .bold()
                                .padding()
                                .frame(maxWidth: .infinity)
                                .foregroundColor(.white)
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .foregroundColor(.blue)
                                )
                        }
                    }
                }
                .padding(.horizontal)
            }
                
        }
        .navigationTitle("Saturday")
//        .navigat
        
    }
}

#Preview {
    
    NavigationStack {
        DayView()
    }
}
