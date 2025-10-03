//
//  AnimationCounterWithCombine.swift
//  CombineDemo
//
//  Created by Paresh  Karnawat on 03/10/25.
//

import SwiftUI
import Combine

struct AnimationCounterWithCombine: View {
    let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
   
    @State var count: Int = 1
    
    var body: some View {
        ZStack{
            RadialGradient(
                gradient:
                    Gradient(colors:[Color(#colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)),Color(#colorLiteral(red: 0.5058823824, green: 0.3372549117, blue: 0.06666667014, alpha: 1))]),
                             center: .center, startRadius: 5, endRadius: 500).ignoresSafeArea()

            HStack(spacing: 15){
                Circle()
                    .offset(y: count == 1 ? -20 : 0)
                Circle()
                    .offset(y: count == 2 ? -20 : 0)
                Circle()
                    .offset(y: count == 3 ? -20 : 0)
            }
            .frame(width:150)
            .foregroundColor(.white)
        }
        .onReceive(timer, perform: { _ in
            withAnimation(.easeInOut(duration: 0.5)) {
                count = count == 3 ? 0 : count + 1
            }
        })
    }
}

#Preview {
    AnimationCounterWithCombine()
}
