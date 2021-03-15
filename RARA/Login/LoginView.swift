//
//  LoginView.swift
//  RARA
//
//  Created by Prithiv Dev on 15/03/21.
//

import SwiftUI

struct LoginView: View {
    
    // this is the emial string
    @State var emailText = String()
    @State var numberText = String()
    
    // a vr instance
    @EnvironmentObject var vr : ViewRouter
    
    //a viewmodal instance for all the backend work
    @StateObject var lm = LogInViewModal()
    
    var body: some View {
        
        ZStack {
            //LoginInTint()
            
            VStack {
                VStack {
                    
                    HStack{
                    VStack{
                        
                        LinearGradient(gradient: Gradient(colors: [.blue, .white]),
                                       startPoint: .top,
                                       endPoint: .bottom)
                            .mask(Text("Login")
                                    .font(.system(size: 50.0, weight: .bold))
                                    .bold()
                                    .opacity(0.6))
                    }.frame(height:200)
                    .padding(.trailing, 250)
                        Spacer()
                    
                    
                    }
                    
                    VStack {
                        
                        TextField("Enter your email address to login with Magic", text: $emailText)
                            .frame(height: 50)
                            
                        
                        
                    }
                    .background(BlurView(style: .extraLight))
                    .cornerRadius(10)
                    .padding()
                    
                VStack {
                    
                    TextField("Enter your number to login with Twillio", text: $numberText)
                        .frame(height: 50)
                    
                }
                .background(BlurView(style: .extraLight))
                .cornerRadius(10)
                .padding()
                    
                    
                    
                }
                
                Spacer()
                
                
                HStack{
                    
                    LoginButton(action: {
                        
                        if !numberText.isEmpty {
                            
                            self.lm.TwillioAuth(tonumber:self.numberText)
                            
                        }
                       
                        
                        if !emailText.isEmpty {
                            
                            let result =  self.lm.loginWithEmail(email: emailText)
                              
                              if result != nil {
                                  self.vr.appState = .loginSucess
                              }

                        }
                        
                    }, title: "Login", emoji: "🔒")
                    
                    .padding(.leading, 50)
                    .padding(.bottom)
                    
                    Spacer()
                    
                }
            }
            
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
