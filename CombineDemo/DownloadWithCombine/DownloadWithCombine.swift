//
//  DownloadWithCombine.swift
//  CombineDemo
//
//  Created by Paresh  Karnawat on 02/10/25.
//

import SwiftUI

struct DownloadWithCombine: View {
    @StateObject var vm = DownloadWithCombineViewModel()
    
    var body: some View {
        List{
            ForEach(vm.posts) { post in
                VStack(alignment:.leading){
                    Text(post.title)
                        .font(.headline)
                    Text(post.body)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .navigationTitle("Download with Combine")
    }
}

#Preview {
    DownloadWithCombine()
}
