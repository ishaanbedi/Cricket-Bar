//
//  BatsmanRow.swift
//  Cricket Bar
//
//  Created by Ishaan Bedi on 22/11/24.
//

import SwiftUI

struct BatsmanRow: View {
    let name: String
    let runs: String
    let balls: String
    let strikeRate: String

    var body: some View {
        HStack {
            Text(name)
                .frame(width: 100, alignment: .leading)
            Text(runs)
            Text(balls)
            Spacer()
            Text("SR: \(strikeRate)")
        }
            .font(.system(.body, design: .monospaced))
    }
}
