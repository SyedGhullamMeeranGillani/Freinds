//
//  CloseButtonView.swift
//  Practice-Project
//
//  Created by Syed Meer Gillani on 15/02/2022.
//

import SwiftUI

struct CloseButtonView: View {
    var body: some View {
                Image(systemName: "xmark")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.all,16)
                    .background(Color.black.opacity(0.6))
                    .clipShape(Circle())
                    
    }
}

struct CloseButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CloseButtonView()
    }
}
