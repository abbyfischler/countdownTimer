//
//  TimeComponentView.swift
//  Countdown Timer
//
//  Created by Abby Fischler on 7/21/21.
//

import SwiftUI

struct TimeComponentView: View {
    var number: String
    var unit: String
    
    var body: some View {
        VStack {
            Text(number)
                .font(.largeTitle)
            Text(unit)
                .font(.caption)
                .opacity(0.5)
        }
    }
}

struct TimeComponentView_Previews: PreviewProvider {
    static var previews: some View {
        TimeComponentView(number: "2", unit: "hours")
    }
}
