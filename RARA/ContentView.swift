//
//  ContentView.swift
//  RARA
//
//  Created by Prithiv Dev on 15/03/21.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var vr : ViewRouter
    
    var body: some View {

        ZStack {
            
         LoginInTint()
         
            
            if self.vr.appState == .welcome {
                Welcome()
            }
            
            if self.vr.appState == .login {
                LoginView()
            }
            
            if self.vr.appState == .loginSucess {
                LoginSucess()
            }
            
        
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
          //  .environmentObject(ViewRouter())
    }
}
