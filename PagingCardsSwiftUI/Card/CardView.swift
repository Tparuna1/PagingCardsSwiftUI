//
//  CardView.swift
//  PagingCardsSwiftUI
//
//  Created by Tornike Parunashvili on 06.07.25.
//

import SwiftUI

struct CardView: View {
    let title: String
    let balance: String
    let icon: Image
    
    private enum Constants {
        static let cornerRadius: CGFloat = 24
        static let iconSize: CGFloat = 72
        static let horizontalPadding: CGFloat = 16
        static let leadingPadding: CGFloat = 20
        static let trailingPadding: CGFloat = 20
        static let spacing: CGFloat = 20
    }
    
    private var gradient: LinearGradient {
        LinearGradient(
            gradient: Gradient(colors: [
                Color.cyan,
                Color.blue
            ]),
            startPoint: .top,
            endPoint: .bottom
        )
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: Constants.cornerRadius, style: .continuous)
                .fill(gradient)
            
            HStack(spacing: Constants.spacing) {
                icon
                    .resizable()
                    .scaledToFit()
                    .frame(width: Constants.iconSize, height: Constants.iconSize)
                    .clipShape(Circle())
                    .padding(.leading, Constants.leadingPadding)
                
                VStack(alignment: .leading, spacing: Constants.spacing) {
                    Text(title)
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.white)
                    Text(balance)
                        .font(.system(size: 16, weight: .regular))
                        .foregroundColor(.white)
                }
                .padding(.trailing, Constants.trailingPadding)
                
                Spacer()
            }
        }
        .padding(.horizontal, Constants.horizontalPadding)
    }
}
