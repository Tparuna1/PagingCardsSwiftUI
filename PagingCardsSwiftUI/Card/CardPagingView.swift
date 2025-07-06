//
//  CardPagingView.swift
//  PagingCardsSwiftUI
//
//  Created by Tornike Parunashvili on 06.07.25.
//

import SwiftUI

struct CardPagingView: View {
    let cards: [CardItems]
    
    private enum Constants {
        static let cardRatio: CGFloat = 0.98
        static let spacing: CGFloat = -16
        static let viewHeight: CGFloat = 160
        static let cardHeight: CGFloat = 140
        static let cornerRadius: CGFloat = 12
        static let shadowRadius: CGFloat = 2
        static let swipeThresholdRatio: CGFloat = 0.2
        static let velocityThreshold: CGFloat = 1000
        static let inactiveScale: CGFloat = 0.9
        static let animationDuration: Double = 0.25
        static let dotSize: CGFloat = 6
        static let dotSpacing: CGFloat = 4
    }
    
    @Binding var currentIndex: Int
    @GestureState private var dragOffset: CGFloat = 0
    
    var body: some View {
        VStack(spacing: 0) {
            GeometryReader { geometry in
                let cardWidth = geometry.size.width * Constants.cardRatio
                let totalCardWidth = cardWidth + Constants.spacing
                let visibleCardPart = (geometry.size.width - cardWidth) / 2
                
                HStack(spacing: Constants.spacing) {
                    ForEach(Array(cards.enumerated()), id: \.1.id) { index, card in
                        CardView(title: card.title, balance: card.balance, icon: card.icon)
                            .frame(width: cardWidth)
                            .scaleEffect(scaleForCard(at: index))
                            .animation(.easeOut(duration: Constants.animationDuration), value: currentIndex)
                            .cornerRadius(Constants.cornerRadius)
                            .shadow(radius: Constants.shadowRadius)
                    }
                }
                .frame(height: Constants.cardHeight)
                .offset(
                    x: currentOffset(
                        screenWidth: geometry.size.width,
                        cardWidth: cardWidth,
                        totalCardWidth: totalCardWidth,
                        visibleCardPart: visibleCardPart
                    )
                )
                .gesture(dragGesture(cardWidth: cardWidth))
            }
            .frame(height: Constants.cardHeight)
            
            Spacer()
            
            HStack(spacing: Constants.dotSpacing) {
                ForEach(0..<cards.count, id: \.self) { index in
                    Circle()
                        .frame(width: Constants.dotSize, height: Constants.dotSize)
                        .foregroundColor(index == currentIndex ? .cyan : .gray)
                        .animation(.easeInOut(duration: Constants.animationDuration), value: currentIndex)
                }
            }
        }
        .frame(height: Constants.viewHeight)
    }
    
    private func currentOffset(
        screenWidth: CGFloat,
        cardWidth: CGFloat,
        totalCardWidth: CGFloat,
        visibleCardPart: CGFloat
    ) -> CGFloat {
        dragOffset - CGFloat(currentIndex) * (totalCardWidth - visibleCardPart)
    }
    
    private func scaleForCard(at index: Int) -> CGFloat {
        abs(currentIndex - index) == 0 ? 1.0 : Constants.inactiveScale
    }
    
    private func dragGesture(cardWidth: CGFloat) -> some Gesture {
        DragGesture()
            .updating($dragOffset) { value, state, _ in
                state = value.translation.width
            }
            .onEnded { value in
                handleDragEnd(value: value, cardWidth: cardWidth)
            }
    }
    
    private func handleDragEnd(value: DragGesture.Value, cardWidth: CGFloat) {
        let offset = value.translation.width
        let velocity = value.predictedEndTranslation.width - offset
        
        if abs(velocity) > Constants.velocityThreshold {
            currentIndex = velocity < 0 ?
                min(currentIndex + 1, cards.count - 1) :
                max(currentIndex - 1, 0)
        } else if offset < -cardWidth * Constants.swipeThresholdRatio {
            currentIndex = min(currentIndex + 1, cards.count - 1)
        } else if offset > cardWidth * Constants.swipeThresholdRatio {
            currentIndex = max(currentIndex - 1, 0)
        }
    }
}
