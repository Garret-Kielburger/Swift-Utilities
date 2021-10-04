//
//  String+Utilities.swift
//  CodableCoreData
//
//  Created by Garret Kielburger on 2021-09-30.
//

import Foundation

extension String {
    static func emptyIfNil(_ optionalString: String?) -> String {
        let text: String
        if let unwrapped = optionalString {
            text = unwrapped
        } else {
            text = ""
        }
        return text
    }
}
