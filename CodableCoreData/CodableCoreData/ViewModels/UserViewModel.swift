//
//  UserViewModel.swift
//  CodableCoreData
//
//  Created by Garret Kielburger on 2021-09-30.
//

import Foundation


struct UserViewModel {
    let avatarUrl: String
    let username: String
    let role: String
    
    init(user: User) {
        // Avatar
        avatarUrl = String.emptyIfNil(user.avatarUrl)
        
        // Username
        username = String.emptyIfNil(user.username)
        
        // Role
        role = String.emptyIfNil(user.role)
    }
}

extension UserViewModel: Equatable {}

func ==(lhs: UserViewModel, rhs: UserViewModel) -> Bool {
    return lhs.avatarUrl == rhs.avatarUrl &&
        lhs.username == rhs.username &&
        lhs.role == rhs.role
}
