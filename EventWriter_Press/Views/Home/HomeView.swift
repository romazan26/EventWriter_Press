//
//  HomeView.swift
//  EventWriter_Press
//
//  Created by Роман on 22.10.2024.
//

import SwiftUI

struct HomeView: View {
    init() {
        UITabBar.appearance().backgroundColor = .main
        UITabBar.appearance().unselectedItemTintColor = .gray
        }
    var body: some View {
        NavigationView {
            ZStack {
                Color.main.ignoresSafeArea()
                TabView() {
                    ArticlesView()
                        .tabItem { TabItemView(imageName: "doc.plaintext.fill", text: "Article")}
                    EventsView()
                        .tabItem {TabItemView(imageName: "calendar.badge.clock", text: "Events")}
                    BudgetView()
                        .tabItem { TabItemView(imageName: "dollarsign.circle.fill", text: "Budget")}
                    Text("Tab Content 2").tabItem {TabItemView(imageName: "richtext.page.fill", text: "Post")}
                    Text("Tab Content 2").tabItem {TabItemView(imageName: "ellipsis.circle.fill", text: "More")}
                    
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
