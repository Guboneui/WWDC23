//
//  CustomTransitionContentView.swift
//  WWDC23
//
//  Created by 구본의 on 2023/06/08.
//

import SwiftUI

struct CustomTransitionContentView: View {
  @State private var show: Bool = false
  
  var body: some View {
    VStack {
      if show {
        Rectangle()
          .fill(.red.gradient)
          .frame(width: 150, height: 150)
          .transition(CustomTransition())
      }
      
      Button("Show View") {
        withAnimation(.init(MyAnimation())) {
          show.toggle()
        }
      }
    }
  }
}

struct CustomTransition: Transition {
  func body(content: Content, phase: TransitionPhase) -> some View {
    content
      .opacity(phase != .identity ? 0 : 1.0)
      .rotation3DEffect(
        .init(degrees: phase.value * (phase == .willAppear ? 90 : -90)),
        axis: (x: 1.0, y: 0.0, z: 0.0)
      )
  }
}

struct MyAnimation: CustomAnimation {
  
  var duration: CGFloat = 1.0
  
  func animate<V>(value: V, time: TimeInterval, context: inout AnimationContext<V>) -> V? where V : VectorArithmetic {
    
    if time > duration { return nil }
    
    //return value.scaled(by: time / duration)
    return value.scaled(by: easeOutBounce(time / duration))
  }
  
  func easeOutBounce(_ x: TimeInterval) -> CGFloat {
    let n1 = 7.5625
    let d1 = 2.75
    var x: TimeInterval = x
    
    if (x<1 / d1) {
      return n1 * x * x
    } else if (x < 2 / d1) {
      x -= 1.5 / d1
      return n1 * x * x + 0.75
    } else if (x < 2.5 / d1) {
      x -= 2.25 / d1
      return n1 * x * x + 0.9375
    } else {
      x -= 2.625 / d1
      return n1 * x * x + 0.984375
    }
  }
}

#Preview {
  CustomTransitionContentView()
}
