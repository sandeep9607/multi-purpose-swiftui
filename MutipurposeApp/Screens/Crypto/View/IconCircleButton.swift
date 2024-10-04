//
//  IconCircleButton.swift
//  MutipurposeApp
//
//  Created by Sandeep on 27/09/24.
//

import SwiftUI

struct IconCircleButton: View {
    let iconName : String
    var body: some View {
        Image(systemName: iconName)
            .font(.headline)
            .foregroundColor(Color.theme1.accent)
            .frame(width: 50, height: 50)
            .background(Circle().foregroundStyle(Color.theme1.background)
            )
            .shadow(color: Color.theme1.accent.opacity(0.25), radius: 10, x: 0, y: 0)
    }
}

#Preview {
    IconCircleButton(iconName: "info")
}
