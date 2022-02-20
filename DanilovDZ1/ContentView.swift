//
//  ContentView.swift
//  DanilovDZ1
//
//  Created by Mikhail Danilov on 20.02.2022.
//

import SwiftUI

struct ContentView: View {

    @State private var selection: Int = 0

    var body: some View {

        TabView(selection: $selection) {
            FirstView(selection: $selection)
                .tabItem {
                    Label("Dashboard", systemImage: "paperplane")
                }
                .tag(0)
            CatalogViewScreen()
                .tabItem {
                    Label("Catalog", systemImage: "folder")
                }
                .tag(1)
            ProfileScreen()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
                .tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct FirstView: View {
    @Binding var selection: Int
    var body: some View {
        Button(action: {
            self.selection = 1 //self.sele
        }) {
            Text("Change to tab 2")
        }
    }
}
