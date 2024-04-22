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
    
    @State private var selectedMonth = 1
    let days = ["Sun", "Mon", "Tues", "Wed", "Thu", "Fri", "Sat"]
    
    var body: some View {
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
                        print("back")
                    } label: {
                        Image(systemName: "lessthan")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 20, height: 32)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    Text("April 2024")
                    Spacer()
                    Button {
                        print("forward")
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
                LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 7)) {
                    ForEach(fetchDates() ) { value in
                        Text("\(value.day)")
                    }
                }
            }
        }
    func fetchDates() -> [CalendarDate] {
        let calendar = Calendar.current
        let currentMonth = fetchSelectedMonth()
        var dates = currentMonth.datesOfMonth().map({CalendarDate(day: calendar.component(.day, from: $0), date: $0) })
        
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

extension Date {
    func datesOfMonth() -> [Date] {
    
        let calendar = Calendar.current
        let currentMonth = calendar.component(.month, from: self)
        let currentYear = calendar.component(.year, from: self)
        
        var startDateComponents = DateComponents()
        startDateComponents.year = currentYear
        startDateComponents.month = currentMonth
        startDateComponents.day = 1
        let startDate = calendar.date(from: startDateComponents)!
        
        var endDateComponents = DateComponents()
        endDateComponents.month = 1
        endDateComponents.day = -1
        let endDate = calendar.date(byAdding: endDateComponents, to: startDate)!
        
        var dates: [Date] = []
        var currentDate = startDate
        
        while currentDate <= endDate {
            dates.append(currentDate)
            currentDate = calendar.date(byAdding: .day, value: 1, to: currentDate)!
        }
        
        return dates
    }
}

#Preview {
    CalendarView()
}
