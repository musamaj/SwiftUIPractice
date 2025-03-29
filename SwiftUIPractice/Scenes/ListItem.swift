//
//  ListItem.swift
//  SwiftUIPractice
//
//  Created by Usama Jamil on 3/29/25.
//

import SwiftUI

struct ListItem: View {
    
    var body: some View {
        return VStack(alignment: .leading) {
            Text("Repo Name")
            Text("Url")
        }
        .padding()
    }
}
