//
//  NSError+Utilities.swift
//  CodableCoreData
//
//  Created by Garret Kielburger on 2021-09-30.
//

import Foundation
extension NSError {
    static func createError(_ code: Int, description: String) -> NSError {
        return NSError(domain: "com.aprearo.TableView",
                       code: 400,
                       userInfo: [
                        "NSLocalizedDescription" : description
            ])
    }
}
