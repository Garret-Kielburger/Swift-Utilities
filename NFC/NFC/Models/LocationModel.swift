//
//  LocationModel.swift
//  NFC
//
//  Created by Garret Kielburger on 2021-10-04.
//

import CoreNFC

struct Location: Codable {
  let name: String
  var visitors: [Visitor]

  init(name: String) {
    self.name = name
    visitors = []
  }

  init?(message: NFCNDEFMessage) {
    guard
      let locationRecord = message.records.first,
      let locationName = locationRecord.wellKnownTypeTextPayload().0
      else {
        return nil
    }

    name = locationName
    visitors = []
  }
}

struct Visitor: Codable, Hashable {
  let name: String

  init(name: String) {
    self.name = name
  }
}
