//
//  RepositoryViewModel.swift
//  SwiftUIPractice
//
//  Created by Usama Jamil on 3/29/25.
//

import Foundation

@MainActor
class RepositoryViewModel: ObservableObject {
    @Published var repositories: [Repository] = []
    @Published var errorMessage: IdentifiableError?
    
    func loadRepositories() async {
        do {
            let repos: [Repository] = try await APIClient.shared.fetch(from: "https://api.github.com/repositories")
            self.repositories = repos
        } catch {
            self.errorMessage = IdentifiableError(message: error.localizedDescription)
        }
    }
}
