//
//  MenuBarView.swift
//  Cricket Bar
//
//  Created by Ishaan Bedi on 22/11/24.
//

import SwiftUI

struct MenuBarView: View {
    let score: String

    var body: some View {
        HStack(spacing: 4) {
            Image(systemName: "cricket.ball.fill")
            Text(score)
                .font(.system(size: 12))
        }
    }
}
