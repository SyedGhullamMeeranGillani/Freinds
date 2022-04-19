//
//  HomeView.swift
//  Freinds
//
//  Created by Syed Meer Gillani on 19/04/2022.
//

import SwiftUI

struct HomeView: View {
    @Environment(\.verticalSizeClass) var verticalSizeClass: UserInterfaceSizeClass?
       @Environment(\.horizontalSizeClass) var horizontalSizeClass: UserInterfaceSizeClass?
       
       var body: some View {
           
           if horizontalSizeClass == .compact && verticalSizeClass == .regular {
               
               Home()
           }
           else if horizontalSizeClass == .regular && verticalSizeClass == .compact {
               
               Home()
               
           }
           else if horizontalSizeClass == .regular && verticalSizeClass == .regular {
               
               Home()
               
               
           }
       }
   }

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
