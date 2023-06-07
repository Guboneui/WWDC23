//
//  AnimationCallBackContentView.swift
//  WWDC23
//
//  Created by 구본의 on 2023/06/08.
//

import SwiftUI
import SwiftData

struct AnimationCallBackContentView: View {
  
//  @State private var show: Bool = false
//  
//  var body: some View {
//    VStack {
//      if show {
//        Text("HEllo")
//      }
//      
//      Button("Show") {
//        withAnimation(.bouncy, completionCriteria: .logicallyComplete) {
//          show.toggle()
//        } completion: {
//          print("end")
//        }
//      }
//    }
//  }
  
  
  @State private var value: CGFloat = 0
  @Bindable var user: UserInfo = .init()
  var body: some View {
    VStack(spacing: 20) {
      TextField("Name", text: $user.name)
      
      TextField("Email", text: $user.email)
      
    }
    .onChange(of: user.name, initial: true) { oldValue, newValue in
      print("userName: \(oldValue) -> \(newValue)")
    }
    .onChange(of: user.email, initial: true) { oldValue, newValue in
      print("userEmail: \(oldValue) -> \(newValue)")
      
    }
  }
  
  
}

#Preview {
  AnimationCallBackContentView()
}



@Observable
class UserInfo {
  var name: String = ""
  var email: String = ""
}
