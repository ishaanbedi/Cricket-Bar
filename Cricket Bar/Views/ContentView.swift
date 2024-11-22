//
//  ContentView.swift
//  Cricket Bar
//
//  Created by Ishaan Bedi on 22/11/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: CricketScoreViewModel
    @State private var showTextField = false
    @State private var customId = ""
    let timer = Timer.publish(every: 10, on: .main, in: .common).autoconnect()

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            if let score = viewModel.cricketScore {

                Text(score.title)
                    .font(.headline)
                Text(score.update)
                    .font(.subheadline)
                    .foregroundColor(.gray)

                Divider()

                HStack {
                    Text(score.livescore)
                        .font(.title2)
                        .bold()
                    Spacer()
                    Text(score.runrate)
                        .foregroundColor(.gray)
                }

                Divider()

                VStack(alignment: .leading) {
                    Text("Batting").font(.headline)
                    BatsmanRow(name: score.batterone,
                        runs: score.batsmanonerun,
                        balls: score.batsmanoneball,
                        strikeRate: score.batsmanonesr)
                    BatsmanRow(name: score.battertwo,
                        runs: score.batsmantworun,
                        balls: score.batsmantwoball,
                        strikeRate: score.batsmantwosr)
                }

                Divider()

                VStack(alignment: .leading) {
                    Text("Bowling").font(.headline)
                    BowlerRow(name: score.bowlerone,
                        overs: score.bowleroneover,
                        runs: score.bowleronerun,
                        wickets: score.bowleronewickers,
                        economy: score.bowleroneeconomy)
                    BowlerRow(name: score.bowlertwo,
                        overs: score.bowlertwoover,
                        runs: score.bowlertworun,
                        wickets: score.bowlertwowickers,
                        economy: score.bowlertwoeconomy)
                }

                Divider()


            } else {
                Text("Unable to load score")
                    .foregroundColor(.red)
            }



            HStack {
                if showTextField {
                    TextField("Enter custom ID", text: $customId)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button("Save") {
                        viewModel.manualId = customId
                        viewModel.fetchScore()
                        showTextField.toggle()
                    }
                }
                Spacer()
                Button(action: {
                    showTextField.toggle()
                }) {
                    Image(systemName: "pencil")
                        .foregroundColor(.blue)
                }
            }

        }
            .padding()
            .frame(width: 300)
            .onAppear {
            viewModel.fetchScore()
        }
            .onReceive(timer) { _ in
            viewModel.fetchScore()
        }
    }
}
