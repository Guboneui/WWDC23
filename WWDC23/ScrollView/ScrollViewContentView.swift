//
//  ScrollViewContentView.swift
//  WWDC23
//
//  Created by 구본의 on 2023/06/08.
//

import SwiftUI

struct ScrollViewContentView: View {
  
  @State private var scrollPosition: Color?
  
  var body: some View {
    GeometryReader {
      let size = $0.size
      
      ScrollView(.horizontal) {
        let colors: [Color] = [.red, .yellow, .green]
        
        LazyHStack(spacing: 25) {
          ForEach(colors, id: \.self) { color in
            RoundedRectangle(cornerRadius: 15)
              .fill(color.gradient)
              .frame(width: 300, height: 200)
          }
        }
        .padding(.horizontal, (size.width - 300) / 2)
        .scrollTargetLayout()
      }
      .scrollTargetBehavior(.viewAligned)
      .scrollPosition(id: $scrollPosition)
    }
    .frame(height: 200)
    .overlay(alignment: .bottom) {
      Button("Scroll Yellow") {
        withAnimation(.snappy) {
          scrollPosition = .purple
        }
      }
      .offset(y: 100)
    }
  }
}

#Preview {
  ScrollViewContentView()
}
