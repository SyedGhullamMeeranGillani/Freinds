//
//  sendemail.swift
//  Freinds
//
//  Created by Syed Meer Gillani on 19/04/2022.
//

import SwiftUI

struct sendemail: View {
    var body: some View {
        Button(action: {
           EmailHelper.shared.sendEmail(subject: "Anything...", body: "", to: "")
         }) {
             Text("Send Email")
         }    }
}

struct sendemail_Previews: PreviewProvider {
    static var previews: some View {
        sendemail()
    }
}
