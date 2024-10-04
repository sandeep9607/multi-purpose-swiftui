//
//  UserViewModel.swift
//  MutipurposeApp
//
//  Created by Sandeep on 30/09/24.
//

import Foundation

class UserViewModel: ObservableObject {
    @Published var users: [UserModel] = []
    @Published var isLoading: Bool = false
    @Published var shouldShowError = false
    @Published var errorMessage: String?
    
    func fetchUsers(){
        let urlString = "https://api.github.com/users"
        isLoading = true
        APIManager.shared.requestGET(url: urlString) { result, error in
            self.isLoading = false
            guard let json = result else {
                self.errorMessage = error ?? Constant.SOMETHING_WRONG
                return
            }
            
            do {
                self.users = try JSONDecoder().decode([UserModel].self, from: json)
            }catch{
                self.errorMessage = Constant.FAILED_PARSE
            }
        }
        
    }
}
