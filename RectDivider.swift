//
//  RectDivider.swift
//  Moonshot
//
//  Created by Alan Yanovich on 2023-12-19.
//

import SwiftUI

struct RectDivider: View {
    var body: some View {
        Rectangle()
            .frame(height: 2)
            .foregroundStyle(.lightBackground)
            .padding(.vertical)
    }
}

#Preview {
    RectDivider()
}
