//
//  AppView.swift
//  Avocados
//
//  Created by Camila Campana on 30/05/22.
//

import SwiftUI

struct AppView: View {

    init() {
        let tabBarAppearance = UITabBar.appearance()
        tabBarAppearance.isTranslucent = false
    }

    var body: some View {
        TabView {
            AvocadosView()
                .tabItem{
                    Image("tabicon-branch")
                    Text("Avocados")
                }
            AvocadosRecipes(headers: headerData, facts: factsData, recipes: recipesData)
                .tabItem {
                    Image("tabicon-book")
                    Text("Recipes")
                }
            RipeningStagesView(ripeningStages: ripeningData)
                .tabItem {
                    Image("tabicon-avocado")
                    Text("Ripening")
                }
            SettingsView()
                .tabItem {
                    Image("tabicon-settings")
                    Text("Settings")
                }
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
