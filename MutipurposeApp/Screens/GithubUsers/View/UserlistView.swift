//
//  UserlistView.swift
//  MutipurposeApp
//
//  Created by Sandeep on 30/09/24.
//

import SwiftUI

struct UserlistView: View {
    @ObservedObject var userVM = UserViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                List {
                    ForEach(userVM.users) { user in
//                        UserItem(user: user)
                        NavigationLink {
                            UserDetail(user: user)
                                .toolbarVisibility(.hidden, for: .tabBar)
                        } label: {
                            UserItem(user: user)
                        }
                    }
                }
                .listStyle(PlainListStyle())
                if (userVM.isLoading){
                    ProgressView()
                        .scaleEffect(2.0, anchor: .center)
                        .progressViewStyle(CircularProgressViewStyle(tint: .black))
                }
            }
            .navigationTitle(Constant.discover)

//            .navigationTitle("Users")
//            .navigationBarTitle(Text("Landmarks"))

        }
        .onAppear(){
            userVM.fetchUsers()
        }
    }
}

#Preview {
    UserlistView()
}
