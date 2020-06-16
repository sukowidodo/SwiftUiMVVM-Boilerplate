

import Foundation
import Combine
import KeychainSwift

class LoginViewModel: ObservableObject {
    
    @Published var result : ResponseLogin?
    @Published var isAlert: Bool = false
    
    private var api: RequestService!
    
    init() {
        self.api = RequestService()
    }
    
    var response: ResponseLogin? {
        if let response = self.result {
            return response
        }
        else {
            return nil
        }
    }
    
    func doLogin(param : [String : Any]) {
        self.api.loginPost(parameters: param) { (data, response, err) in
            DispatchQueue.main.async{
                self.result = data
                let keychain = KeychainSwift()
                if let data = data {
                    if data.code == 200 {
                        keychain.set(data.data?.token ?? "", forKey: "mySecureToken")
                        self.isAlert = false
                    }else{
                        self.isAlert = true
                    }
                }
                //print(keychain.get("mySecureToken") ?? "")
            }
            
        }
        
    }
    
}
