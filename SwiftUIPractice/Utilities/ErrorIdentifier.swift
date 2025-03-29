//
//  ErrorIdentifier.swift
//  SwiftUIPractice
//
//  Created by Usama Jamil on 3/29/25.
//

import Foundation

struct IdentifiableError: Identifiable {
    let id = UUID() // Unique identifier
    let message: String
}
