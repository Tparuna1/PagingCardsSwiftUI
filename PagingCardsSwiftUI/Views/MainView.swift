//
//  MainView.swift
//  PagingCardsSwiftUI
//
//  Created by Tornike Parunashvili on 06.07.25.
//

import SwiftUI

struct MainView: View {
    @State private var currentIndex = 1
    
    private let sampleCards: [CardItems] = [
        CardItems(title: "Savings", balance: "$1,200.50", icon: Image("piggy-bank")),
        CardItems(title: "Vacation", balance: "$850.00", icon: Image("yacht")),
        CardItems(title: "Goals", balance: "$230.75", icon: Image("goal"))
    ]
    
    var body: some View {
        VStack {
            CardPagingView(cards: sampleCards, currentIndex: $currentIndex)
            Spacer()
        }
        .padding()
    }
}

#Preview {
    MainView()
}
