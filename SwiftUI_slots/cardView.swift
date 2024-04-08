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
    private let transition : AnyTransition = AnyTransition.move(edge: .bottom)
    var body: some View {
        VStack {
            if label == "apple" {
                Image(label)
                .resizable()
                .transition(transition)
                .cornerRadius(20)
            } else if label == "cherry" {
                Image(label)
                .resizable()
                .transition(transition)
                .cornerRadius(20)
            }else{
                Image(label)
                .resizable()
                .transition(transition)
                .cornerRadius(20)
            }
        }
        .aspectRatio(1,contentMode: .fit)
        .background(cardbackground.opacity(0.5))
    }
}

#Preview {
    cardView(label: Binding.constant("apple"),cardbackground: Binding.constant(Color.white))
}
