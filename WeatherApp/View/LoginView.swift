//
//  LoginView.swift
//  WeatherApp
//
//  Created by macbook on 6/17/20.
//  Copyright © 2020 Prashant Gaikwad. All rights reserved.
//
import Combine
import SwiftUI

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
       
    @Binding var signInSuccess:Bool
    
    @State private var alert: Bool = false

    @ObservedObject var loginVM : LoginViewModel
       
    init(signInSuccess: Binding<Bool>) {
        self.loginVM = LoginViewModel()
        self._signInSuccess = signInSuccess
    }
       
       var body: some View {
                LoadingView(isShowing: Binding<Bool>(get: { () -> Bool in
                    self.loginVM.isLoading
                }, set: { (Bool) in
                    
                }), message: "Please wait...") {
                   VStack {
                       Text("Username")
                           .frame(maxWidth: .infinity, alignment: Alignment.leading)
                    TextField("Enter username...", text: self.$username)
                           .textFieldStyle(RoundedBorderTextFieldStyle())
                           .autocapitalization(.none)
                           .foregroundColor(.red)
                       Text("Password").frame(maxWidth: .infinity, alignment: Alignment.leading)
                    SecureField("Enter password...", text: self.$password)
                           .textFieldStyle(RoundedBorderTextFieldStyle())
                           .autocapitalization(.none)
                           .foregroundColor(.red)
                       
                       Button(action: {
                           self.loginVM.doLogin(param: [
                                   "username" : self.username,
                                   "password" : self.password
                               ]
                               ){ (data) in
                                //print(data)
                                if data?.code == 200 {
                                    self.signInSuccess = true
                                }else{
                                    self.alert = true
                                }
                            }
                           
                       }) {
                           Text("Login").foregroundColor(.blue)
                       }.alert(isPresented: self.$alert) { () -> Alert in
                        Alert(
                            title: Text("Error"),
                            message: Text("\(self.loginVM.result?.message ?? "")"),
                            dismissButton: .default(Text("OK"))
                        )
                    }
                
                   }.padding()
            }
       }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(signInSuccess:.constant(false))
    }
}
