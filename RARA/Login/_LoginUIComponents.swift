//
//  _LoginUIComponents.swift
//  RARA
//
//  Created by Prithiv Dev on 15/03/21.
//

import SwiftUI

struct _LoginUIComponents: View {
    var body: some View {
        Text("dfg")
    }
}


struct LoginButton : View {
    
    var action : () -> Void
    var title = String()
    var emoji = String()
    
    var body: some View {
        Button(action:action) {
            VStack {
                
                HStack {
                    ZStack {
                        Color.white
                        HStack {
                            
                            Text("\(title)")
                                .font(.system(size: 20.0, weight: .semibold))
                                .foregroundColor(Color(.systemBlue))
                                .font(.headline)
                                .padding(.leading)
                              
                            Spacer()

                            Text("\(emoji)")
                                .foregroundColor(.white)
                                .scaleEffect(1.5)
                                .padding()
                        }
                    }
                }
                .frame(maxWidth: 150)
                .frame(height:60)
                .cornerRadius(15, antialiased: true)
                
            }
        }.buttonStyle(ScanButtonStyle())
    }
}

struct ScanButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        
        
        
        configuration.label
  
            .scaleEffect(configuration.isPressed ? 0.9: 1.0)
            .shadow(color:  configuration.isPressed ? Color(.systemPurple).opacity(0) : Color(.systemBlue).opacity(0.7) , radius: 15, x: 0, y: 5)
            
    }
}

struct LoginInTint : View {
    
    var body: some View {
        
        Color.black
        .edgesIgnoringSafeArea(.all)
        LinearGradient(gradient: Gradient(colors: [Color.black, Color(.systemBlue).opacity(0.2)]), startPoint: .leading, endPoint: .bottomLeading)
        .edgesIgnoringSafeArea(.all)
        .opacity(0.6)

        
    }
}

struct _LoginUIComponents_Previews: PreviewProvider {
    static var previews: some View {
        _LoginUIComponents()
    }
}
