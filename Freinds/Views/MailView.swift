//////
//////  MailView.swift
//////  Freinds
//////
//////  Created by Syed Meer Gillani on 19/04/2022.
//////
////
//import Foundation
//import UIKit
//import MessageUI
//import SwiftUI
//
////
////
////struct MailView: UIViewRepresentable {
////
////    @Environment(\.presentationMode) var presentation
////    @Binding var result: Result<MFMailComposeResult,Error>?
////
////    let newSubject: String
////    let newMsBody : String
////
////    class Coordinator: NSObject, MFMailComposeViewControllerDelegate{
////        @Binding var presentation: PresentationMode
////        @Binding var result: Result<MFMailComposeResult,Error>?
////
////        init(presentation: Binding<PresentationMode>,
////             result: Binding< Result<MFGMailComposeResult, Error>?>){
////            _presentation = presentation
////            _result = result
////        }
////
////        func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?){
////            defer{
////                $presentation.wrappedValue.dismiss()
////            }
////            guard error == nil else{
////                self.result = .failure(error!)
////                return
////            }
////
////        }
////
////
////    }
////
////    func makeCoordinator() -> Coordinator{
////        return Coordinator(presentation: presentation, result: $result)
////    }
////
////    func makeUIViewController(contextr: UIViewControllerRepresentableContext<MailView>) -> MFMailComposeViewController{
////        let vc = MFMailComposeViewController()
////        vc.mailComposeDelegate = context.coordinator
////        vc.setToRecipients(["abc@icloud.com"])
////        vc.setSubject(newSubject)
////        vc.setMessageBody(newMsBody, isHTML: false)
////        return vc
////    }
////
////    func updateUIViewController(_ uiViewController : MFMailComposeViewController, contect: UIViewControllerRepresentableContext<MailView>){
////
////    }
////
////
////}
//
//
//struct MailView: UIViewRepresentable {
//    func makeUIView(context: MFMailComposeViewController) -> MFMailComposeViewController {
//        let vc = MFMailComposeViewController()
//        return vc
//    }
//    
//    
//    func updateUIView(_ uiView: MFMailComposeViewController, context: Context) {}
//
//  
//    
//    class EmailHelper: NSObject, MFMailComposeViewControllerDelegate {
//        public static let shared = EmailHelper()
//        private override init() {
//            //
//        }
//        
//        func sendEmail(subject:String, body:String, to:String){
//            if !MFMailComposeViewController.canSendMail() {
//                print("No mail account found")
//                // Todo: Add a way to show banner to user about no mail app found or configured
//                // Utilities.showErrorBanner(title: "No mail account found", subtitle: "Please setup a mail account")
//                return //EXIT
//            }
//            
//            let picker = MFMailComposeViewController()
//            
//            picker.setSubject(subject)
//            picker.setMessageBody(body, isHTML: true)
//            picker.setToRecipients([to])
//            picker.mailComposeDelegate = self
//            
//            EmailHelper.getRootViewController()?.present(picker, animated: true, completion: nil)
//        }
//        
//        func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
//            EmailHelper.getRootViewController()?.dismiss(animated: true, completion: nil)
//        }
//        
//     
//    }
//
//
//}
