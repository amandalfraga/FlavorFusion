//
//  Calender.swift
//  Flavor Fusion (iOS)
//
//  Created by Camby Goff on 4/18/24.
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

struct CalendarView: View {
    
    @State private var selectedMonth = 0
    @State private var selectedDate = Date()
    let days = ["Sun", "Mon", "Tues", "Wed", "Thu", "Fri", "Sat"]
    
    var body: some View {
        
        NavigationStack {
            VStack {
                Text("Calendar")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .bold()
                
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.gray)
                VStack (spacing: 20){
                    Text("Select a Day")
                        .bold()
                    HStack{
                        Spacer()
                        Button {
                            withAnimation {
                                selectedMonth -= 1
                            }
                        } label: {
                            Image(systemName: "lessthan")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 20, height: 32)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        Text(selectedDate.monthAndYear())
                        Spacer()
                        Button {
                            withAnimation {
                                selectedMonth += 1
                            }
                        } label: {
                            Image(systemName: "greaterthan")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 16, height: 28)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                    }
                    HStack {
                        ForEach(days, id: \.self) { day in
                            
                            Text(day)
                                .font(.system(size: 12, weight: .medium))
                                .frame(maxWidth: .infinity)
                        }
                    }
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 7), spacing: 20) {
                        ForEach(fetchDates() ) { value in
                            ZStack {
                                if value.day != -1 {
                                    NavigationLink{
                                        EmptyView()
                                    } label: {
                                        Text("\(value.day)")
                                            .foregroundStyle(.black)
                                            .background {
                                                ZStack (alignment: .bottom){
                                                    
                                                    if value.date.string() == Date().string() {
                                                        
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
                            .frame(width: 32, height: 32)
                        }
                    }
                    .onChange(of: selectedMonth) { _ in
                        selectedDate = fetchSelectedMonth()
                    }
                }
            }
        }
    }
    func fetchDates() -> [CalendarDate] {
        let calendar = Calendar.current
        let currentMonth = fetchSelectedMonth()
        var dates = currentMonth.datesOfMonth().map({CalendarDate(day: calendar.component(.day, from: $0), date: $0) })
        
        let firstDayOfWeek = calendar.component(.weekday, from: dates.first?.date ?? Date())
        
        for _ in 0..<firstDayOfWeek - 1 {
            dates.insert(CalendarDate(day: -1, date: Date()), at: 0)
        }
        
        return dates
    }
    func fetchSelectedMonth() -> Date {
        let calendar = Calendar.current
        
        let month = calendar.date(byAdding: .month, value: selectedMonth, to: Date())
        return month!
    }
    
    struct CalendarDate: Identifiable {
        let id = UUID()
        var day: Int
        var date: Date
    }
}



#Preview {
    CalendarView()
}
