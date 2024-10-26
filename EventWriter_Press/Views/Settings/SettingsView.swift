//
//  SettingsView.swift
//  EventWriter_Press
//
//  Created by Роман on 26.10.2024.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    @Environment(\.dismiss) var dismiss
    @State private var isPresentShare = false
    @State private var isPresentPolicy = false
    @State var urlShare = "https://www.apple.com/app-store/"
    @State var urlPrivacy = "https://google.com"
    @State var alert = false

    @StateObject var vmBudg: BudgetViewModel
    @StateObject var vmArt: ArticlesViewModel
    @StateObject var vmEvent: EventsViewModel
    @StateObject var vmPost: PostViewModel
    
    var body: some View {
        ZStack {
            Color.main.ignoresSafeArea()
            VStack(alignment: .leading){
               
                    Text("More")
                        .foregroundStyle(.white)
                        .font(.system(size: 34, weight: .heavy))
                
                LazyVGrid(columns: [GridItem(), GridItem()]) {
                    //MARK: - Share App Button
                    Button(action: {isPresentShare.toggle()}, label: {
                        SettingButtonView(text: "SHARE APP", image: "square.and.arrow.up.fill")
                    })
                    
                    //MARK: - Rate App Button
                    Button {
                        SKStoreReviewController.requestReview()
                    } label: {
                        SettingButtonView(text: "RATE APP", image: "star.fill")
                    }
                    
                    //MARK: - Privacy button
                        Button(action: {isPresentPolicy.toggle()}, label: {
                            SettingButtonView(text: "PRIVACY POLICY", image: "text.document.fill")
                        })
                    
                    //MARK: - Reset button
                    Button {
                        alert = true
                    } label: {
                        SettingButtonView(text: "Reset progress", image: "arrow.circlepath", color: true)
                    }

                }

            }.padding()
        }
        .alert(isPresented: $alert){
            Alert(title: Text("Reset Confirmation"),
                  message: Text("Your progress will be permanently reset. Do you really want to delete all data?"),
                  primaryButton: .cancel(),
                  secondaryButton: .default(Text("Reset"), action: {
                vmArt.resetData()
                vmBudg.resetData()
                vmPost.resetData()
                vmEvent.resetData()
            }))
        }
        .navigationBarBackButtonHidden(true)
        .sheet(isPresented: $isPresentShare, content: {
            ShareSheet(items: urlShare )
        })
        .sheet(isPresented: $isPresentPolicy, content: {
            WebViewPage(urlString: URL(string: urlPrivacy)!)
        })
    }
}


struct ShareSheet: UIViewControllerRepresentable{
    var items: String
    func makeUIViewController(context: Context) -> UIActivityViewController {
        let av = UIActivityViewController(activityItems: [items], applicationActivities: nil)
        return av
    }
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}


