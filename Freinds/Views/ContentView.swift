//
//  ContentView.swift
//  Freinds
//
//  Created by Syed Meer Gillani on 18/04/2022.
//

import SwiftUI

struct ContentView: View {
    
    var device  = UIDevice.current.userInterfaceIdiom
    var body: some View {
        if device == .pad || device == .mac{
           
            
                        Home()
                            
            
                    
                
               
                   
            }else{
                
                 
                             Home()
                                 
                 
                
            }
           
            
        
    
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
