//
//  ContentView.swift
//  SwiftUIPractice
//
//  Created by Usama Jamil on 3/27/25.
//

import SwiftUI

struct RepositoryListView: View {
    @StateObject private var viewModel = RepositoryViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.repositories) { repo in
                VStack(alignment: .leading) {
                    Text(repo.name)
                        .font(.headline)
                    Text("By \(repo.owner.login)")
                        .foregroundColor(.gray)
                }
            }
            .navigationTitle("GitHub Repositories")
            .task {
                await viewModel.loadRepositories()
            }
            .alert(item: $viewModel.errorMessage) { message in
                Alert(title: Text("Error"), message: Text(message.message), dismissButton: .default(Text("OK")))
            }
        }
    }
}
