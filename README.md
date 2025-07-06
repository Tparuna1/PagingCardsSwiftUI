# PagingCardsSwiftUI

A modern SwiftUI component that displays horizontally scrollable cards with paging behavior and elegant animations. Each card showcases a title, balance, and icon with support for asset-based images. The component is fully customizable and reusable in any iOS project.

---

## Features

- Smooth horizontal paging of cards
- Animated scale effect for the active card
- Page indicator dots
- Supports images from the asset catalog
- SwiftUI-native layout using `GeometryReader` and `DragGesture`
- Lightweight, customizable, and easy to integrate

---

## Use Case

This component is ideal for apps that need to display:
- Account or wallet cards
- Budget categories
- Goal tracking or progress cards
- Any horizontally scrollable summary items

---

## Structure

- `CardItems.swift`: Data model representing each card's content.
- `CardView.swift`: Reusable SwiftUI view for a single card.
- `YAJarCardPagingView.swift`: Scrollable and swipeable card pager with animation and dot indicators.
- `MainView.swift`: Demo view that integrates the paging component with sample data.

---

## Card Design

Each card displays:
- An icon
- A title
- A balance
- A gradient background with smooth corners and shadow

<img src="https://github.com/user-attachments/assets/27b5d059-81c8-4958-98e1-77923a32c69f"  width="129" height="279">

<img src="https://github.com/user-attachments/assets/67a83cef-0907-4f0d-a780-64407f5f02e0"  width="129" height="279">



---

## Getting Started

### Installation

Clone this repository or copy the source files into your SwiftUI project.

### Example Integration

```swift
@State private var currentIndex = 0

let cards = [
    CardItems(title: "Savings", balance: "$1,200.50", icon: Image("SavingsIcon")),
    CardItems(title: "Vacation", balance: "$850.00", icon: Image("VacationIcon")),
    CardItems(title: "Groceries", balance: "$230.75", icon: Image("GroceriesIcon"))
]

YAJarCardPagingView(cards: cards, currentIndex: $currentIndex)
