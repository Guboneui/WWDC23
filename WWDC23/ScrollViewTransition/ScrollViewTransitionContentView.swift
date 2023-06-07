//
//  ScrollViewTransitionContentView.swift
//  WWDC23
//
//  Created by 구본의 on 2023/06/08.
//

import SwiftUI

struct ScrollViewTransitionContentView: View {
  var body: some View {
    ScrollView(.vertical) {
      LazyVStack {
        ForEach(1...30, id: \.self) { _ in
          RoundedRectangle(cornerRadius: 8)
            .fill(.green.gradient)
            .frame(height: 150)
            .scrollTransition(
              topLeading: .interactive,
              bottomTrailing: .interactive) { view, phase in
                view
                  .opacity(1 - (phase.value < 0 ? -phase.value : phase.value))
        
              
            }
        }
      }.padding(.horizontal, 30)
    }
  }
}

#Preview {
  ScrollViewTransitionContentView()
}
