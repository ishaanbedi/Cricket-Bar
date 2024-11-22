//
//  CricketScoreViewModel.swift
//  Cricket Bar
//
//  Created by Ishaan Bedi on 22/11/24.
//

import Foundation

class CricketScoreViewModel: ObservableObject {
    @Published var cricketScore: CricketScore?
    @Published var isLoading = false
    @Published var manualId: String?
    private var timer: Timer?

    init() {
        fetchScore()
        startAutoRefresh()
    }

    deinit {
        timer?.invalidate()
    }

    private func startAutoRefresh() {
        timer = Timer.scheduledTimer(withTimeInterval: 10.0, repeats: true) { [weak self] _ in
            self?.fetchScore()
        }
    }

    func fetchScore() {
        isLoading = true
        let id = manualId ?? "91778"
//        feel free to use this endpoint, just don't fuck it up with requests
        guard let url = URL(string: "https://cricket.ishn.link/score?id=\(id)") else { return }

        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            DispatchQueue.main.async {
                self?.isLoading = false
                if let data = data {
                    do {
                        let decoder = JSONDecoder()
                        self?.cricketScore = try decoder.decode(CricketScore.self, from: data)
                    } catch {
                        print("Decoding error: \(error)")
                    }
                }
            }
        }.resume()
    }
}
