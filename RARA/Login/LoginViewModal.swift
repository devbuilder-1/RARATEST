//
//  LoginViewModal.swift
//  RARA
//
//  Created by Prithiv Dev on 15/03/21.
//

import Foundation
import SwiftUI
import MagicSDK
import Alamofire


class LogInViewModal : ObservableObject {
   
  
    
    @State var magic = Magic.shared
    var resultString = String()
    var userData = userdata()
    
    func loginWithEmail(email :String) -> Any? {
        
        
              let configuration = LoginWithMagicLinkConfiguration(email: email)
              
        magic!.auth.loginWithMagicLink(configuration, response: { response in
                  guard let token = response.result
                      else { return print("Error:", response.error.debugDescription) }
                  print("Result", token)
                self.resultString = token
            
              })
        
        return resultString
        
    
    }
    
    func TwillioAuth(tonumber: String) -> Void {
    
     let accountSID = ProcessInfo.processInfo.environment["ACbf95e957f509427561c685b7c4b63310"]
       let authToken = ProcessInfo.processInfo.environment["b78937817ead52dd8eb64911cde6a3d8"]

      let url = "https://api.twilio.com/2010-04-01/Accounts/\(accountSID)/Messages"
      let parameters = ["From": "2019361170", "To": "\(tonumber)", "Body": "Hello from RARA!"]

        
      AF.request(url, method: .post, parameters: parameters)
        .authenticate(username: accountSID!, password: authToken!)
        .responseJSON { response in
          debugPrint(response)
      }

        
      RunLoop.main.run()
        
        
        
        
        
        
        
        
//        struct Request : JSONCodable {
//            var FROM : String
//            var TO : String
//            var body :String
//        }
//
//            if let accountSID = ProcessInfo.processInfo.environment["TWILIO_ACCOUNT_SID"],
//               let authToken = ProcessInfo.processInfo.environment["TWILIO_AUTH_TOKEN"] {
//
//        let url = URL(string: "https://api.twilio.com/2010-04-01/Accounts/\(accountSID)/Messages")!
//        var request = URLRequest(url: url)
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.httpMethod = "POST"
//        request.setValue(authToken, forHTTPHeaderField: "password")
//        request.setValue(accountSID, forHTTPHeaderField: "user")
//                request.httpBody = Request(FROM: "2019361170", TO: "", body: <#T##String#>)
//
//                request.log()
//
//                let res = self.bm.synchronousDataTaskWithURL(with: request)
//                guard let data = res.0 else {
//                    print("No data in response: \(res.2?.localizedDescription ?? "Unknown error").")
//                    return .errorOther
//                }
//                #if DEBUG
//                print(String(bytes: data, encoding: .utf8)!)
                
    
    
}
    
    func getUserInfo(completionHandler: @escaping(userdata) -> Void) {
        
        magic!.user.getMetadata(response: { response in
                  guard let metadata = response.result
                      
                 else { return print("Error:", response.error.debugDescription) }
                  print("Result", metadata)

            
            self.userData.email = metadata.email ?? ""
            self.userData.issuer = metadata.issuer ?? ""
            self.userData.publicAddress = metadata.publicAddress ?? ""
            
            completionHandler(self.userData)
              }
        
        )
        
        
        
    }
    
    
    
    
    
}
