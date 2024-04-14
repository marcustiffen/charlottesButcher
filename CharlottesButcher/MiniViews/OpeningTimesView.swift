//
//  OpeningTimesView.swift
//  CharlottesButcher
//
//  Created by Marcus Tiffen on 29/01/2024.
//

import SwiftUI

struct OpeningTimesView: View {
    let daysOfWeek: [String] = ["", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
    
    let times = ["7:00","8:00", "9:00", "10:00", "11:00", "12:00", "13:00", "14:00", "15:00", "16:00", "17:00"]
    
    var body: some View {
          Grid {
            GridRow {
                ForEach(daysOfWeek, id: \.self) { day in
                    Text(day)
                }
            }
            
              ForEach(times, id: \.self) { time in
                  GridRow {
                      Text(time)
                      //                    ForEach(0..<5) { _ in
                      //                        Color.green
                      //                    }
                  }
                  GridRow {
                      ForEach(1..<5) { _ in
                          Color.green
                      }
                      Divider()
                  }
              }
        }
    }
}

#Preview {
    OpeningTimesView()
}
