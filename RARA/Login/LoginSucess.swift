//
//  LoginSucess.swift
//  RARA
//
//  Created by Prithiv Dev on 15/03/21.
//

import SwiftUI

struct LoginSucess: View {
    
    @StateObject var lm = LogInViewModal()
    
    @State var email = String()
    @State var issuer = String()
    @State var address = String()
    
    var body: some View {
        
        ZStack{
            LoginInTint()
            
        VStack {
            VStack {
                
                HStack{
                VStack{
                    
                    LinearGradient(gradient: Gradient(colors: [.blue, .white]),
                                   startPoint: .top,
                                   endPoint: .bottom)
                        .mask(Text("Login Sucess")
                                .font(.system(size: 50.0, weight: .bold))
                                .bold()
                                .opacity(0.6))
                }.frame(height:200)
                .padding(.trailing, 250)
                    Spacer()
                
                
                }
                
                VStack {
                    
                    HStack{
                        
                        Text("📧")
                            .padding(.leading)
                            Text("\(email)")
                                .font(.caption)
                        Spacer()
                        
                    }
                    .frame(width: 300, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .background(Color.white)
                    .cornerRadius(15, antialiased: true)
                    .padding(.bottom, 10)
                    
                    
                    HStack{
                        
                        Text("🔒")
                            .padding(.leading)
                            Text("\(issuer)")
                                .font(.caption)
                        Spacer()
                        
                    }
                    .frame(width: 300, height: 50, alignment: .center)
                    .background(Color.white)
                    .cornerRadius(15, antialiased: true)
                    .padding(.bottom, 10)
                    
                    
                    HStack {
                        
                        Text("🌎")
                            .padding(.leading)
                        Text("\(self.address)")
                            .font(.caption)
                        Spacer()
                        
                    }
                    .frame(width: 300, height: 50, alignment: .center)
                    .background(Color.white)
                    .cornerRadius(15, antialiased: true)
                    .padding(.bottom, 10)
                    
                    
                    
                    
                    
                }
                .frame(width: 340, height: 400, alignment: .center)
                .background(BlurView(style: .light))
                .cornerRadius(20, antialiased: true)
                
                
                
                
                
                
            }
            .onAppear(){
                self.lm.getUserInfo(completionHandler: {
                    result1 in

                    self.email = result1.email
                    self.issuer = result1.issuer
                    self.address = result1.publicAddress

                })
                
          
                
                print("\(self.email)\n\(self.issuer)\n\(self.address)")
            }
        }
            
        }
    }
}

struct LoginSucess_Previews: PreviewProvider {
    static var previews: some View {
        LoginSucess()
    }
}
