//
//  Welcome.swift
//  RARA
//
//  Created by Prithiv Dev on 15/03/21.
//

import SwiftUI

struct Welcome: View {
    
    @EnvironmentObject var vr : ViewRouter
    
    //parallax effect stuff
    @ObservedObject var manager = MotionMaker()
    
    var body: some View {
        ZStack {
         //   LoginInTint()
            
            VStack {
                
                VStack {
                    
                    Image("RARAL")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(.horizontal)
                        .padding()
                      //  .modifier(ParallaxMotionModifier(manager: self.manager, magnitude: 10))
                    
              
    
                    
                }
                .background(LinearGradient(gradient: Gradient(colors: [Color.red.opacity(0.8), Color.blue]), startPoint: .leading, endPoint: .bottomLeading).opacity(0.5))
                .cornerRadius(40, antialiased: true)
                .padding(.all, 20)
                .shadow(color:Color(.systemBlue).opacity(0.4) , radius: 55, x: 0, y: 5)
                
                
                HStack{
                VStack{
                    LinearGradient(gradient: Gradient(colors: [.pink, .blue]),
                                   startPoint: .top,
                                   endPoint: .bottom)
                        .mask(Text("The next generation social wallet")
                                .font(.title2)
                                .bold()
                                .padding(.bottom)
                                .opacity(0.6))
                }
                .padding(.bottom, 350)
                
                    Spacer()
                }
                
                Spacer()
                
                
                HStack{
                LoginButton(action: {
                    
                    self.vr.appState = .login
                    
                }, title: "Next", emoji: "👋")
                .padding(.leading, 50)
                .padding(.bottom)
                
                    Spacer()
                    
                }
                
            }
            
        }
    }
}

struct Welcome_Previews: PreviewProvider {
    static var previews: some View {
        Welcome()
    }
}
