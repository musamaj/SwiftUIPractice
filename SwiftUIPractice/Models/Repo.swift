//
//  Repo.swift
//  SwiftUIPractice
//
//  Created by Usama Jamil on 3/29/25.
//

import Foundation

struct Repository: Codable, Identifiable {
    let id: Int
    let name: String
    let owner: Owner
    let html_url: String
}

struct Owner: Codable {
    let login: String
    let avatar_url: String
}
