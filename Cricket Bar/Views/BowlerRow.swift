//
//  BowlerRow.swift
//  Cricket Bar
//
//  Created by Ishaan Bedi on 22/11/24.
//

import SwiftUI

struct BowlerRow: View {
    let name: String
    let overs: String
    let runs: String
    let wickets: String
    let economy: String

    var body: some View {
        HStack {
            Text(name)
                .frame(width: 100, alignment: .leading)
            Text("\(overs)-\(runs)-\(wickets)")
            Spacer()
            Text("Eco: \(economy)")
        }
            .font(.system(.body, design: .monospaced))
    }
}
