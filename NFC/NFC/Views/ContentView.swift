//
//  ContentView.swift
//  NFC
//
//  Created by Garret Kielburger on 2021-10-04.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    TabView {
      VisitorView()
        .tabItem {
          VStack {
            Image(systemName: "magnifyingglass")
            Text("Visitors")
          }
        }
      AdminView()
        .tabItem {
          VStack {
            Image(systemName: "lock")
            Text("Admin")
          }
        }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      ContentView()
    }
  }
}
