//
//  APIManager.swift
//  MutipurposeApp
//
//  Created by Sandeep on 27/09/24.
//

import Foundation
import Alamofire

class APIManager {
    
    static let shared = APIManager()
//    let serialQueue = DispatchQueue(label: "serialQ")
    
//    class func headers() -> HTTPHeaders {
//        var headers: HTTPHeaders = [
//            "Content-Type": "application/json",
//            "Accept": "application/json"
//        ]
//        if let authToken = UserDefaultManager.shared.stringValue(key: UserDefaultManager.jwtToken){
//            headers["Authorization"] = "Bearer " + authToken
//        }
//        return headers
//    }
    
    func requestGET(url: String,parameter: NSDictionary = [:], header: HTTPHeaders? = nil, loader:Bool = true, completionHandler: @escaping (_ result: Data?, _ error: String?) -> Void) {
        
        if loader{
//            startLoader()
        }
        
        //MARK: check internet connection here
//        if !isNetworkReachable() {
//            stopLoader()
//            completionHandler(nil,Constant.NO_INTERNET)
//            return
//        }
        
//        let sessionManager = Alamofire.SessionManager.default
//        sessionManager.adapter = MyRequestAdapter.shared
//        
//        sessionManager
        AF.request(url,
                               method: .get,
                               encoding: JSONEncoding.default, headers: header)
        .validate(statusCode: 200..<505)
        .responseData { [self] (response) in
//            self.stopLoader()
            //            print(curl(from: response.request!))
            switch response.result {
            case .success:
                if let httpStatusCode = response.response?.statusCode {
                    switch(httpStatusCode) {
                    case 200, 201:
                        completionHandler(response.data,nil)
                    case 400,402,406:
                        completionHandler(nil,Constant.SOMETHING_WRONG)
//                    case 401:
//                        let json = JSON(response.data)
//                        if let message = json["message"].string{
//                            completionHandler(nil,message)
//                        }else{
//                            refreshToken()
//                        }
                    case 404:
                        let bodyMessage = response.data.map { String(decoding: $0, as: UTF8.self) } ?? Constant.SOMETHING_WRONG
                        if bodyMessage != ""{
                            completionHandler(nil,bodyMessage)
                        }else{
                            completionHandler(nil,Constant.SOMETHING_WRONG)
                        }
                    case 500, 502:
                        completionHandler(nil,Constant.INTERNAL_SERVER_ERROR)
                    default:
                        completionHandler(response.data,nil)
                    }
                }
            case .failure(let error):
                if error._code == NSURLErrorTimedOut {
                    completionHandler(nil, Constant.REQUEST_TIMEOUT)
                }else{
                    completionHandler(nil, Constant.SOMETHING_WRONG)
                }
            }
        }
    }
}
