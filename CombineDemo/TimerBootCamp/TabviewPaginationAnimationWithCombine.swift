//
//  TabviewPaginationAnimationWithCombine.swift
//  CombineDemo
//
//  Created by Paresh  Karnawat on 03/10/25.
//

import SwiftUI
import Combine

struct TabviewPaginationAnimationWithCombine: View {
    let timer = Timer.publish(every: 3.0, on: .main, in: .common).autoconnect()
    
    @State var count: Int = 1
    
    var body: some View {
        ZStack{
            RadialGradient(
                gradient:
                    Gradient(colors:[Color(#colorLiteral(red: 0.5278430581, green: 0.9124641418, blue: 0.8919962645, alpha: 1)),Color(#colorLiteral(red: 0.09455991536, green: 0.5664678216, blue: 0.5333219767, alpha: 1))]),
                             center: .center, startRadius: 5, endRadius: 500).ignoresSafeArea()
            TabView(selection: $count) {
                Rectangle()
                    .foregroundColor(.red)
                    .tag(1)
                Rectangle()
                    .foregroundColor(.blue)
                    .tag(2)
                Rectangle()
                    .foregroundColor(.green)
                    .tag(3)
                Rectangle()
                    .foregroundColor(.orange)
                    .tag(4)
                Rectangle()
                    .foregroundColor(.gray)
                    .tag(5)
            }
            .frame(height: 200)
            .tabViewStyle(PageTabViewStyle())
            .padding()
        }
        .onReceive(timer, perform: { _ in
            withAnimation(.default) {
                count = count == 5 ? 1 : count + 1
            }
        })
    }
}

#Preview {
    TabviewPaginationAnimationWithCombine()
}
