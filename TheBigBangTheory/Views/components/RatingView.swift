//
//  RatingView.swift
//  TheBigBangTheory
//
//  Created by María Pérez  on 4/12/24.
//

import SwiftUI

struct RatingView: View {
    
    @Binding var rating: Int
    var maximumRating = 5
    var onImage = Image(systemName: "star.fill")
    var offColor = Color.gray
    var onColor = Color.yellow
    
    var body: some View {
        HStack {
            ForEach(1..<maximumRating + 1, id: \.self) { number in
                Button {
                    rating = number
                } label: {
                    onImage
                        .foregroundColor(number > rating ? offColor : onColor)
                }
            }
        }
    }
}

#Preview {
    RatingView(rating: .constant(4))
}
