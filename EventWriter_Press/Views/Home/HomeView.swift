//
//  HomeView.swift
//  EventWriter_Press
//
//  Created by Роман on 22.10.2024.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var vmBudg = BudgetViewModel()
    @StateObject var vmArt = ArticlesViewModel()
    @StateObject var vmEvent = EventsViewModel()
    @StateObject var vmPost = PostViewModel()
    
    init() {
        UITabBar.appearance().backgroundColor = .main
        UITabBar.appearance().unselectedItemTintColor = .gray
        }
    var body: some View {
        NavigationView {
            ZStack {
                Color.main.ignoresSafeArea()
                TabView() {
                    ArticlesView(vm: vmArt)
                        .tabItem { TabItemView(imageName: "doc.plaintext.fill", text: "Article")}
                        
                    EventsView(vm: vmEvent)
                        .tabItem {TabItemView(imageName: "calendar.badge.clock", text: "Events")}
                    
                    BudgetView(vm: vmBudg)
                        .tabItem { TabItemView(imageName: "dollarsign.circle.fill", text: "Budget")}
                    
                    PostsView(vm: vmPost)
                        .tabItem {TabItemView(imageName: "pencil.slash", text: "Posts")}
                    
                    SettingsView(vmBudg: vmBudg, vmArt: vmArt, vmEvent: vmEvent, vmPost: vmPost)
                        .tabItem {TabItemView(imageName: "ellipsis.circle.fill", text: "More")}
                    
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
