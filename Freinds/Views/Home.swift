//
//  UserDetailView.swift
//  Freinds
//
//  Created by Syed Meer Gillani on 18/04/2022.
//

import Combine
import SwiftUI

struct Home: View {
    @StateObject var viewModel : UserViewModelImpl = UserViewModelImpl(service: UserServiceImpl())
    var columns = [GridItem()]
    
    @Namespace var namespace
    
    @State var show = false
    @State var isDisabled = false
    @State var user : Result? = nil
    
    
    @State private var searchURL: URL = URL(string: "mailto:syed@icloud.com")!

    var body: some View {
        Group{
            switch viewModel.state {
            case .loading:
                ProgressView()
            case .failed(let error):
                ErrorView(error: error) {
                    self.viewModel.getUser()
                }
            
            case .success(let content):
                VStack{
                    Text("FRIENDS APP" )
                        .font(.title)
                        .fontWeight(.bold)
                    .font(.custom("", size: 22))
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .padding()
                    
                    ZStack{
                ScrollView{
                    LazyVGrid(columns: columns, spacing: 20){
                        
                            ForEach(content) { user in
                                VStack{
                                    
                                    ProfileCard(user: user)
                                        .matchedGeometryEffect(id: user.id, in:  namespace, isSource: !show   )
                                        .frame( width: UIScreen.main.bounds.width*0.80, height: 400)
                                        .onTapGesture {
                                            withAnimation(.spring(response: 0.2, dampingFraction: 2, blendDuration: 0)){
                                                self.show.toggle()
                                                self.isDisabled = true
                                                self.user = user
                                            }
                                        }.disabled(isDisabled)
                                   
//
                                }.matchedGeometryEffect(id: "container\(user.id)", in: namespace,isSource: !show)
                        }
                    }.frame(maxWidth: .infinity)
                }.zIndex(1)
                        
                        if self.user != nil{
                            ZStack(alignment: .topTrailing){
                                
                                VStack{
                                ScrollView{
                                    
                                    ProfileCard(user: self.user!)
                                        .matchedGeometryEffect(id: user!.id, in: namespace)
                                        .frame(height: 500)
                                    VStack(alignment: .leading, spacing: 15){
                                    Text("Detail")
                                        .font(.system(size: 22, weight: .heavy, design: .serif))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    HStack{
                                    Text("City: ")
                                        .font(.system(size: 20, weight: .medium, design: .monospaced))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    Text(self.user!.location.city)
                                    }
                                    HStack{
                                    Text("State: ")
                                        .font(.system(size: 20, weight: .medium, design: .monospaced))
                                        .frame(maxWidth: .infinity, alignment: .leading)

                                    Text(self.user!.location.state)
                                    }
                                    HStack{
                                    Text("Email: ")
                                        .font(.system(size: 20, weight: .medium, design: .monospaced))
                                        .frame(maxWidth: .infinity, alignment: .leading)

                                        Text(self.user!.email).foregroundColor(Color.blue)
                                            .onTapGesture {
                                                self.searchURL = URL(string: "mailto:\(self.user!.email)")!
                                                print("print email \(self.user!.email)")
                                               let app = UIApplication.shared
                                               if let scene = app.connectedScenes.first {
                                                  scene.open(self.searchURL, options: nil, completionHandler: nil)
                                               }
                                            }
                                    }
                                    HStack{
                                    Text("Phone Number: ")
                                        .font(.system(size: 20, weight: .medium, design: .monospaced))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        Text(self.user!.phone)
                                    }
                                        
                                        Text("Email Link is working fine on Physical iPhone device but I didn't test on iPad Device due to unavailable of iPad Device")
                                    }.padding(.horizontal,25)
                                }
                            }
                                CloseButtonView()
                                    .padding()
                                    
                                    .onTapGesture {
                                        withAnimation(.spring(response: 0.2, dampingFraction: 2, blendDuration: 0)){
                                        self.show.toggle()
                                        self.user = nil
                                        
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3){
                                        self.isDisabled = false
                                        }
                                        }
                                    }
                            }
                            .background(Color.white)
                                .clipShape(RoundedRectangle(cornerRadius: 16,style: .continuous))
                                .matchedGeometryEffect(id: "container\(user!.id)", in: namespace)
                                .edgesIgnoringSafeArea(.all)
                                .zIndex(2)
                          
                        }
                    }
                }
               
           
            }
          
        }
            .onAppear {
                for i in 0 ... 5{
                self.viewModel.getUser()
                    print("print")
                }
   
            }
           
    }
}
//
//struct UserDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserDetailView( searchURL: URL(string: "mailto:syed@icloud.com")!)
//    }
//}
//
