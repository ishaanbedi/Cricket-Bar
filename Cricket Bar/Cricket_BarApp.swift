//
//  Cricket_BarApp.swift
//  Cricket Bar
//
//  Created by Ishaan Bedi on 22/11/24.
//

import SwiftUI

@main
struct Cricket_BarApp: App {

    @StateObject private var viewModel = CricketScoreViewModel()

    var body: some Scene {
        MenuBarExtra {
            ContentView(viewModel: viewModel)
        } label: {
            MenuBarView(score: viewModel.cricketScore?.livescore ?? "Loading...")
        }
            .menuBarExtraStyle(.window)
    }
}
