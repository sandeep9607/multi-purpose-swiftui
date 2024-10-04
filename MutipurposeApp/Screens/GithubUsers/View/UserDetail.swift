//
//  UserDetail.swift
//  MutipurposeApp
//
//  Created by Sandeep on 04/10/24.
//

import SwiftUI

struct UserDetail: View {
    let user: UserModel
    var body: some View {
        VStack(alignment: .center) {
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
            .frame(width: 150, height: 150)
//            Text(user.login ?? "")
//                .font(.title2)
//                .fontWeight(.medium)
            HStack(spacing: 15) {
                VStack() {
                    Text(user.login ?? "")
                        .font(.title2)
                        .fontWeight(.medium)
//                    Text(user.reposURL ?? "")
//                        .font(.subheadline)
                    Link("Repos", destination: URL(string: user.reposURL ?? "")!)
                        .foregroundStyle(Color.blue)
                }
            }
            Spacer()
        }
    }
}

#Preview {
    UserDetail(user: devUSER)
}
