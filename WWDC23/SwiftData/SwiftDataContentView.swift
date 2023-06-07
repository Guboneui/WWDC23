//
//  SwiftDataContentView.swift
//  WWDC23
//
//  Created by 구본의 on 2023/06/07.
//

import SwiftUI
import SwiftData

struct SwiftDataContentView: View {
  /// Context
  @Environment(\.modelContext) private var ctx
  
  /// Fetching Data
  @Query(FetchDescriptor(
    /// With Macros
    predicate: #Predicate { $0.isLiked == true },
    sortBy: [SortDescriptor(\.dateAdded, order: .reverse)]
  ), animation: .snappy) private var favourites: [Person]
  
  @Query(FetchDescriptor(
    /// With Macros
    predicate: #Predicate { $0.isLiked == false },
    sortBy: [SortDescriptor(\.dateAdded, order: .reverse)]
  ), animation: .snappy) private var normal: [Person]
  
  var body: some View {
    NavigationStack {
      List {
        DisclosureGroup("Favourites") {
          ForEach(favourites) { person in
            HStack {
              Text(person.name)
              
              Spacer()
              
              Button(action: {
                person.isLiked.toggle()
                try? ctx.save()
              }, label: {
                Image(systemName: "suit.heart.fill")
                  .tint(person.isLiked ? .red : .gray)
              })
            }
            .swipeActions {
              Button {
                ctx.delete(person)
                try? ctx.save()
              } label: {
                Image(systemName: "trash.fill")
              }
              .tint(.red)
            }
          }
        }
        
        DisclosureGroup("Normal") {
          ForEach(normal) { person in
            HStack {
              Text(person.name)
              
              Spacer()
              
              Button(action: {
                person.isLiked.toggle()
                try? ctx.save()
              }, label: {
                Image(systemName: "suit.heart.fill")
                  .tint(person.isLiked ? .red : .gray)
              })
            }
            .swipeActions {
              Button {
                ctx.delete(person)
                try? ctx.save()
              } label: {
                Image(systemName: "trash.fill")
              }
              .tint(.red)
            }
          }
        }
      }
      .navigationTitle("Swift Data")
      .toolbar(content: {
        ToolbarItem(placement: .topBarTrailing) {
          Button("Add Item") {
            /// Adding Data
            let person: Person = Person(name: "Hello User \(Date().formatted(date: .numeric, time: .omitted))")
            
            /// Inserting into Context
            ctx.insert(person)
            print("Insert")
            do {
              try ctx.save()
              print("Success Save")
            } catch {
              print(error.localizedDescription)
            }
          }
        }
      })
    }
  }
}

//#Preview {
//  ContentView()
//}

/// Model
@Model
class Person {
  var name: String
  var isLiked: Bool
  var dateAdded: Date
  
  init(name: String, isLiked: Bool = false, dateAdded: Date = .init()) {
    self.name = name
    self.isLiked = isLiked
    self.dateAdded = dateAdded
  }
}
