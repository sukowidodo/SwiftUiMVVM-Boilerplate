

import Foundation
import Combine

class LoginViewModel: ObservableObject {
    
    @Published var result : ResponseLogin?
    
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
            //print(data)
            self.result = data
            print(self.result)
            
        }
        
    }
    
}
