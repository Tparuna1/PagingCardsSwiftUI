//
//  CardItems.swift
//  PagingCardsSwiftUI
//
//  Created by Tornike Parunashvili on 06.07.25.
//

import SwiftUI

struct CardItems: Identifiable {
    let id = UUID()
    let title: String
    let balance: String
    let icon: Image
}
