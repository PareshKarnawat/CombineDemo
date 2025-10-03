//
//  MainMenuScreen.swift
//  CombineDemo
//
//  Created by Paresh  Karnawat on 03/10/25.
//

import SwiftUI

struct MainMenuScreen: View {
    var body: some View {
        NavigationStack {
            List{
                NavigationLink("Download data with Combine") {
                    DownloadWithCombine()
                }
                NavigationLink("Timers with combine") {
                    TimersListScreen()
                }
                NavigationLink("Custom subscribers with combine") {
                    SubscriberBootCamp()
                }
            }
            .navigationTitle("Combine")
        }
    }
}

#Preview {
    MainMenuScreen()
}
