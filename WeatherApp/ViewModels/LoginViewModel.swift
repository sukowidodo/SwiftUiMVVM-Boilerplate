import Foundation
import Combine
import KeychainSwift

class LoginViewModel: ObservableObject {
    
    @Published var result : ResponseLogin?
    @Published var isAlert: Bool = false
    @Published var isLoginSuccess: Bool = false
    @Published var isLoading: Bool = false
    
    private var api: RequestService!
    
    init() {
        self.api = RequestService()
    }
    
    func doLogin(param : [String : Any], completion: @escaping (ResponseLogin?) -> Void) {
        isLoading = true
        self.api.loginPost(parameters: param) { (data, response, err) in
            DispatchQueue.main.async{
                self.isLoading = false
                self.result = data
                let keychain = KeychainSwift()
                if let data = data {
                    completion(data)
                    if data.code == 200 {
                        keychain.set(data.data?.token ?? "", forKey: "mySecureToken")
                        //print(keychain.get("mySecureToken"))
                    }
                }
            }
        }
    }
}
