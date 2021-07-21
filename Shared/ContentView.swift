//
//  ContentView.swift
//  Shared
//
//  Created by Abby Fischler on 7/21/21.
//

import SwiftUI

struct ContentView: View {
    @State var countdownDate: Date = Date()
    @State var currentDate: Date = Date()
    @State var dateComponents: [String: Int]?
    
    var body: some View {
        NavigationView {
            VStack {
                TimerView(countdownDate: $countdownDate, currentDate: $currentDate, dateComponents: $dateComponents)
                    .navigationTitle("Countdown")
                
                Spacer()
                    .frame(height: 32)
                
                DatePicker("Countdown Date", selection: $countdownDate)
            }
            .padding()
            .onAppear {
                let timer =
                    Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                        currentDate = Date()
                        
                        dateComponents = (countdownDate - currentDate).components
                        print(dateComponents)
                    }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(countdownDate: Date())
    }
}
