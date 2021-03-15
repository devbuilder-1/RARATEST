//
//  ViewRouter.swift
//  RARA
//
//  Created by Prithiv Dev on 15/03/21.
//

import Foundation
import SwiftUI

class ViewRouter: ObservableObject {
    
    enum applicationState {
        
        
        case welcome
        case login
        case loginSucess
        
    }
    
    
    //sets the default state to welcome
    @Published var appState : applicationState = applicationState.welcome
    
    
}
