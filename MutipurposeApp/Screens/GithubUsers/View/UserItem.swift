//
//  UserItem.swift
//  MutipurposeApp
//
//  Created by Sandeep on 30/09/24.
//

import SwiftUI

struct UserItem: View {
    let user: UserModel
    
    var body: some View {
        HStack(spacing: 15) {
            AsyncImage(url: URL(string: user.avatarURL ?? ""))
            {image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
            }placeholder: {
                Circle()
                    .foregroundStyle(Color.teal)
                
            }
            .frame(width: 50, height: 50)
            VStack(alignment: .leading) {
                Text(user.login ?? "")
                    .font(.title2)
                    .fontWeight(.medium)
                Text(user.url ?? "")
                    .font(.subheadline)
            }
        }
    }
}

#Preview {
    UserItem(user: devUSER)
}
