//
//  ImageIconComponent.swift
//  TheBigBangTheory
//
//  Created by María Pérez  on 5/12/24.
//

import SwiftUI

struct ImageIconComponent: View {
    var isActive: Bool
    var imageActive: String
    var imageInactive: String
    var colorActive: Color
    var colorInactive: Color
    
    var body: some View {
        Image(systemName: isActive ? imageActive : imageInactive)
            .foregroundColor(isActive ? colorActive : colorInactive)
            .frame(width: 32, height: 32)
            .background(
                Circle()
                    .fill(Color(.systemGray6))
                    .opacity(0.7)
            )
    }
}
