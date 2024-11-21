//
//  ContentView.swift
//  EventWriter_Press
//
//  Created by Роман on 21.10.2024.
//

import SwiftUI

struct LoadingView: View {
    
    @State private var percents: Int = 0
    @AppStorage("isFirstLaunch") private var isFirstLaunch: Bool?
    @State private var isLoading: Bool = false
    @StateObject var vm = LoadingViewModel()
    
    var progress: Progress {
        Progress(totalUnitCount: 100)
    }
    var body: some View {
        ZStack {
            Color.main.ignoresSafeArea()
            
                Image(.logo)
                    .resizable()
                    .frame(width: 139, height: 160)
            VStack {
                Spacer()
                CustomProgressView(progress: percents)
                    .padding()
            }
                    
            
        }
        .fullScreenCover(isPresented: $isLoading, content: {
                if vm.isConnected {
                    WebViewPage(urlString: (URL(string: vm.urlString)!))
                }else
            if isFirstLaunch ?? true {
                IntroView()
            }else{
                HomeView()
            }
            
         })
        .onAppear(perform: {
            Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true) { timer in
                if percents < 100{
                    percents += 1
                }else {
                    timer.invalidate()
                    isLoading = true
                }
            }
        })
    }
}

#Preview {
    LoadingView()
}
