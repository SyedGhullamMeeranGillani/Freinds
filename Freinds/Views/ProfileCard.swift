//
//  ProfileCard.swift
//  Freinds
//
//  Created by Syed Meer Gillani on 18/04/2022.
//

import SwiftUI


struct ProfileCard: View {
    
    let user: Result
    
    
    
    
    
    var body: some View {
       
            
        ZStack(alignment: .bottom){
            
            
            LazyVStack(spacing: 10){
              
//                HStack{
                AsyncImage(url: URL(string: user.picture.large)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(.leading,20)
                        .frame(height: 150)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .cornerRadius(20)
                } placeholder: {
                    Rectangle().foregroundColor(.gray.opacity(0.2))
                }
//                    Spacer()
//                }
                Text("\(user.name.first) \(user.name.last)" )
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                .font(.custom("", size: 22))
                .padding(.leading,20)
                .frame(maxWidth: .infinity,alignment: .leading)
                
            
                Text(user.location.state)
                    .font(.footnote)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .font(.custom("", size: 18))
                    .padding(.leading,20)
                    .frame(maxWidth: .infinity,alignment: .leading)
                
                    
            }.padding()
        }
        .frame(maxWidth:.infinity,maxHeight: .infinity)
        .background(LinearGradient(colors: [
            
            Color(UIColor(red: 0.685, green: 0.333, blue: 0.962, alpha: 1)),
            
            Color(UIColor(red: 0.962, green: 0.333, blue: 0.786, alpha: 1))
            
        ], startPoint: .leading, endPoint: .trailing))
        
        .cornerRadius(20)
        
    }
}

struct ProfileCard_Previews: PreviewProvider {
    static var previews: some View {
        ProfileCard(user: Result(name: Name(title: "no title", first: "Syed", last: "Meer"), email: "testing@gmail.com", location: Location(city: "multan", state: "Punjab"), phone: "000-111-1234", picture: Picture(large: "asdfkjl", medium: "laksjdf", thumbnail: "lskjf")))
    }
}
