//
//  ContentView.swift
//  Appetizers
//
//  Created by sanwar on 30/07/24.
//

import SwiftUI

struct AppetizersTabView: View {
    var body: some View {

            TabView{
                AppetizerListView()
                    .tabItem {
                         Label("Home", systemImage: "house")
                     }
                AppetizerAccountView()
                    .tabItem {
                         Label("Sent", systemImage: "person")
                     }

                AppetizerOrderView()
                    .tabItem {
                         Label("Sent", systemImage: "bag")
                     }
            
            }.tint(Color("brandPrimary"))
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizersTabView()
    }
}
