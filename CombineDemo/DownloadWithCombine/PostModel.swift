//
//  PostModel.swift
//  CombineDemo
//
//  Created by Paresh  Karnawat on 02/10/25.
//

import SwiftUI

struct PostModel: Identifiable, Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}


