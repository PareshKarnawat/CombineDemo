//
//  CurrentTimerWithCombine.swift
//  CombineDemo
//
//  Created by Paresh  Karnawat on 03/10/25.
//

import SwiftUI
import Combine

struct CurrentTimerWithCombine: View {
    let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
    
     @State var currentDate : Date = Date()
    
     var dateFormatter : DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        return formatter
     }

    var body: some View {
        ZStack{
            RadialGradient(
                gradient:
                    Gradient(colors:[Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)),Color(#colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1))]),
                             center: .center, startRadius: 5, endRadius: 500).ignoresSafeArea()
            
            Text(dateFormatter.string(from: currentDate))
                .font(.system(size:100, weight: .semibold, design: .rounded))
                .foregroundColor(.white)
                .lineLimit(1)
                .minimumScaleFactor(0.1)
        }
        .onReceive(timer, perform: { value in
            currentDate = value
        })
    }
}

#Preview {
    CurrentTimerWithCombine()
}
