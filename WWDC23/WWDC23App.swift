//
//  WWDC23App.swift
//  WWDC23
//
//  Created by 구본의 on 2023/06/07.
//

import SwiftUI

@main
struct WWDC23App: App {
  var body: some Scene {
//    /// SwiftData
//    WindowGroup {
//      SwiftDataContentView()
//    }
//    .modelContainer(for: Person.self)
    
    WindowGroup {
      AnimationCallBackContentView()
    }
  }
}

/*
 Attach the model container to the window group
 You can also add additional peorperties like an undo manager, etc.
 */
