//
//  CountDownTimerWithCombine.swift
//  CombineDemo
//
//  Created by Paresh  Karnawat on 03/10/25.
//

import SwiftUI
import Combine

struct CountDownTimerWithCombine: View {
    //Countdown
    let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
    @State var count: Int = 10
    @State var finishedText : String? = nil
 
    var body: some View {
        ZStack{
            RadialGradient(
                gradient:
                    Gradient(colors:[Color(#colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)),Color(#colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1))]),
                center: .center, startRadius: 5, endRadius: 500).ignoresSafeArea()
            
            
            Text(finishedText ?? "\(count)")
                .font(.system(size:100, weight: .semibold, design: .rounded))
                .foregroundColor(.white)
                .lineLimit(1)
                .minimumScaleFactor(0.1)
        }
        .onReceive(timer, perform: { _ in
            if count <= 1 {
                finishedText = "Wow!"
            } else {
                count -= 1
            }
        })
    }
}

#Preview {
    CountDownTimerWithCombine()
}
