//
//  AdminView.swift
//  NFC
//
//  Created by Garret Kielburger on 2021-10-04.
//

import SwiftUI

struct AdminView: View {
  @State private var locationName = ""

  var body: some View {
    NavigationView {
      Form {
        Section(
          header: Text("Location Setup"),
          footer: Text("This will clear all visitor data from tag.")
            .fontWeight(.bold)
        ) {
          TextField("Enter Location Name", text: $locationName)
            .autocapitalization(.words)
          // swiftlint:disable multiple_closures_with_trailing_closure multiline_arguments
          Button(action: {
            NFCUtility.performAction(.setupLocation(locationName: self.locationName)) { _ in
              self.locationName = ""
            }
          }) {
            Text("Save Location…")
          }
          .disabled(locationName.isEmpty)
        }
        // swiftlint:enable multiple_closures_with_trailing_closure multiline_arguments
      }
      .navigationBarTitle("Administration")
    }
    .navigationViewStyle(StackNavigationViewStyle())
  }
}

struct AdminView_Previews: PreviewProvider {
  static var previews: some View {
    AdminView()
  }
}
