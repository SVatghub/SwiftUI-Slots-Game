//
//  cardView.swift
//  SwiftUI_slots
//
//  Created by Sahil on 07/04/24.
//

import SwiftUI

struct cardView: View {
    @Binding var label : String
    @Binding var cardbackground : Color
    var body: some View {
        Image(label)
            .resizable()
            .aspectRatio(1,contentMode: .fit)
            .background(cardbackground.opacity(0.5))
            .cornerRadius(20)
    }
}

#Preview {
    cardView(label: Binding.constant("apple"),cardbackground: Binding.constant(Color.white))
}
