//
//  AnimateSymbolView.swift
//  WWDC23
//
//  Created by 구본의 on 2023/06/08.
//

import SwiftUI

struct AnimateSymbolView: View {
  
  @State private var animateSymbol: Bool = false
  @State private var switching: Bool = false
  
  var body: some View {
    VStack(spacing: 10) {
      Image(systemName: "suit.heart.fill")
        .font(.largeTitle)
        .tint(.yellow)
        .symbolEffect(.bounce, options: .repeating, value: animateSymbol)
        .onTapGesture {
          animateSymbol.toggle()
        }
      
      
      PhaseAnimator(SFImage.allCases, trigger: switching) { symbol in
        ZStack {
          Circle()
            .fill(symbol.color.gradient)
          Image(systemName: symbol.rawValue)
            .font(.largeTitle)
            .foregroundStyle(.white)
        }.frame(width: 100, height: 100)
        
      } animation: { symbol in
        switch symbol {
        case .heart: .smooth(duration: 1.0, extraBounce: 0.3)
        case .house: .smooth(duration: 1.0, extraBounce: 0.3)
        case .iphone: .smooth(duration: 1.0, extraBounce: 0.3)
        }
      }
      .onTapGesture {
        switching = true
      }
    }
    
    
  }
}

#Preview {
  AnimateSymbolView()
}


enum SFImage: String, CaseIterable {
  case heart = "suit.heart.fill"
  case house = "house.fill"
  case iphone = "iphone"
  
  var color: Color {
    switch self {
    case .heart: return .red
    case .house: return .blue
    case .iphone: return .green
    }
  }
}
