//
//  TimerView.swift
//  Countdown Timer
//
//  Created by Abby Fischler on 7/21/21.
//

import SwiftUI

extension Date {
    static func - (firstElement: Date, secondElement: Date) -> TimeInterval {
        return firstElement.timeIntervalSinceReferenceDate - secondElement.timeIntervalSinceReferenceDate
    }
}

extension TimeInterval {
    var components: [String: Int] {
        var seconds: Int = Int(self)
        // Figure out how many days
        let days = seconds / 86_400
        // Subtract the seconds for those days
        seconds = seconds % 86_400
        
        // Figure out how many hours
        let hours = seconds / 3_600
        // Subtract the seconds for those hours
        seconds = seconds % 3_600
        
        // Figure out how many minutes
        let minutes = seconds / 60
        // Subtract the seconds for those minutes
        seconds = seconds % 60
        
        return ["days": days,
               "hours":  hours,
               "minutes": minutes,
               "seconds": seconds]
    }
}

struct TimerView: View {
    @Binding var countdownDate: Date
    @Binding var currentDate: Date
    @Binding var dateComponents: [String: Int]?
    
    
    var body: some View {
        HStack (alignment: .top) {
            if let dateComponents = dateComponents {
                if dateComponents["days"] != nil {
                    TimeComponentView(number: String(dateComponents["days"]!), unit: "Days")
                    Text(":")
                        .font(.largeTitle)
                }
                if dateComponents["hours"] != nil {
                    TimeComponentView(number: String(dateComponents["hours"]!), unit: "Hours")
                    Text(":")
                        .font(.largeTitle)
                }
                if dateComponents["minutes"] != nil {
                    TimeComponentView(number: String(dateComponents["minutes"]!), unit: "Minutes")
                    Text(":")
                        .font(.largeTitle)
                }
                
                if dateComponents["seconds"] != nil {
                    TimeComponentView(number: String(dateComponents["seconds"]!), unit: "Seconds")
                }
            } else {
                TimeComponentView(number: "?", unit: "Days")
                Text(":")
                    .font(.largeTitle)
                TimeComponentView(number: "?", unit: "Hours")
                Text(":")
                    .font(.largeTitle)
                TimeComponentView(number: "?", unit: "Minutes")
                Text(":")
                    .font(.largeTitle)
                TimeComponentView(number: "?", unit: "Seconds")
            }
        }
        .foregroundColor(.accentColor)
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView(countdownDate: .constant(Date()), currentDate: .constant(Date()), dateComponents: .constant(["seconds": 2]))
    }
}
