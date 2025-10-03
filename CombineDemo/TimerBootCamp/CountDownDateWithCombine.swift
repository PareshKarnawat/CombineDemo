//
//  CountDownDateWithCombine.swift
//  CombineDemo
//
//  Created by Paresh  Karnawat on 03/10/25.
//

import SwiftUI
import Combine

struct CountDownDateWithCombine: View {
    let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
   
    @State var timeRemaining : String = ""
   
    let futureDate : Date = Calendar.current.date(byAdding: .hour,value: 1, to: Date()) ?? Date()
    
    func updateTimeRemaining() {
        let remaining = Calendar.current.dateComponents([.hour, .minute,.second], from: Date(), to: futureDate)
        let hour = remaining.hour ?? 0
        let minute = remaining.minute ?? 0
        let second = remaining.second ?? 0
        
        timeRemaining = "\(hour):\(minute):\(second)"
    }
    
    var body: some View {
        ZStack{
            RadialGradient(
                gradient:
                    Gradient(colors:[Color(#colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)),Color(#colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1))]),
                             center: .center, startRadius: 5, endRadius: 500).ignoresSafeArea()
            
            Text(timeRemaining)
                .font(.system(size:100, weight: .semibold, design: .rounded))
                .foregroundColor(.white)
                .lineLimit(1)
                .minimumScaleFactor(0.1)
        }
        .onReceive(timer, perform: { _ in
            updateTimeRemaining()
        })
    }
}

#Preview {
    CountDownDateWithCombine()
}
