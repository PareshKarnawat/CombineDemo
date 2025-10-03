//
//  TimersListScreen.swift
//  CombineDemo
//
//  Created by Paresh  Karnawat on 03/10/25.
//

import SwiftUI

struct TimersListScreen: View {
    var body: some View {
        List{
            NavigationLink("Current Timer"){
                CurrentTimerWithCombine()
            }
            NavigationLink("Count Down timer"){
                CountDownTimerWithCombine()
            }
            NavigationLink("Count Down Date"){
                CountDownDateWithCombine()
            }
            NavigationLink("Animation With Counter"){
                AnimationCounterWithCombine()
            }
            NavigationLink("TabView Pagination"){
                TabviewPaginationAnimationWithCombine()
            }
        }
        .navigationTitle("Timer Bootcamp")
    }
}

#Preview {
    TimersListScreen()
}
