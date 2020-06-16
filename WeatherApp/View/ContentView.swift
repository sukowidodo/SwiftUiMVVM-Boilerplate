//
//  ContentView.swift
//  WeatherApp
//
//  Created by Prashant Gaikwad on 14/06/20.
//  Copyright © 2020 Prashant Gaikwad. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @ObservedObject var loginVM : LoginViewModel
    
    init() {
        self.loginVM = LoginViewModel()
    }
    
    var body: some View {
        VStack {
            Text("Username")
                .frame(maxWidth: .infinity, alignment: Alignment.leading)
            TextField("Enter username...", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(.none)
                .foregroundColor(.red)
            Text("Password").frame(maxWidth: .infinity, alignment: Alignment.leading)
            SecureField("Enter password...", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(.none)
                .foregroundColor(.red)
    
            Button(action: {
                self.loginVM.doLogin(param: [
                        "username" : self.username,
                        "password" : self.password
                    ]
                )
                
            }) {
                Text("Login").foregroundColor(.blue)
            }
            
            Text("")
                .alert(isPresented: Binding<Bool>(get: { () -> Bool in
                    self.loginVM.isAlert
                }, set: { (Bool) in
                    true
                })) {
                    Alert(
                        title: Text("Error"),
                        message: Text("\(self.loginVM.result?.message ?? "")"),
                        dismissButton: .default(Text("OK"))
                    )
                }
        }.padding()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
