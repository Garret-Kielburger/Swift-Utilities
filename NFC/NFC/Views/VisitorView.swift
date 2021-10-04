//
//  VisitorView.swift
//  NFC
//
//  Created by Garret Kielburger on 2021-10-04.
//

import SwiftUI

struct VisitorView: View {
  @State private var visitorName = ""
  @State private var locationModel: Location?

  private var visitorSection: some View {
    Section(header: Text("Visitor Information")) {
      TextField("Enter Your Name", text: $visitorName)
        .textContentType(.name)
        .autocapitalization(.words)

      Button(action: {
        NFCUtility.performAction(.addVisitor(visitorName: self.visitorName)) { location in
          self.locationModel = try? location.get()
          self.visitorName = ""
        }
      }) {
        Text("Add To Tag…")
      }
      .disabled(visitorName.isEmpty)
    }
  }

  private var scanSection: some View {
    Section {
      Button(action: {
        NFCUtility.performAction(.readLocation) { location in
          self.locationModel = try? location.get()
        }
      }) {
        Text("Scan Location Tag…")
      }
    }
  }

  private var scannedSection: some View {
    locationModel.map { location in
      Section(
        header: Text("Location: \(location.name)"),
        footer: Text("Visitors: \(location.visitors.count)")) {
          ForEach(location.visitors, id: \.self) { visitor in
            Text(visitor.name)
          }
      }
    }
  }

  var body: some View {
    NavigationView {
      Form {
        visitorSection
        scanSection
        scannedSection
      }
      .navigationBarTitle("Visitors")
    }
    .navigationViewStyle(StackNavigationViewStyle())
  }
}

struct VisitorView_Previews: PreviewProvider {
  static var previews: some View {
    VisitorView()
  }
}

