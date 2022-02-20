//
//  CatalogViewScreen.swift
//  DanilovDZ1
//
//  Created by Mikhail Danilov on 20.02.2022.
//

import SwiftUI

final class FoodListViewModel: ObservableObject {

    @Published private(set) var foods = [
        Food(name: "Strowberry", isFav: false),
        Food(name: "Apple", isFav: false),
        Food(name: "Chesse", isFav: false),
        Food(name: "Tomato", isFav: false),
    ]
}

struct Food: Identifiable {
    var id: String { name }
    let name: String
    let isFav: Bool

}

struct CatalogViewScreen: View {

    @ObservedObject var foodListViewModel: FoodListViewModel = .init()
    var body: some View {

        NavigationView {
            FoodList()
                .environmentObject(foodListViewModel)
                .navigationTitle("Foods")
        }
    }
}

struct FoodList: View {

    @EnvironmentObject var foodListViewModel: FoodListViewModel

    var body: some View {
        List(foodListViewModel.foods) { food in
            NavigationLink(destination: DetailView(food: food)) {
                DetailView(food: food)
            }

        .listStyle(.plain)
        }

    }
}

struct CatalogViewScreen_Previews: PreviewProvider {
    static var previews: some View {
        CatalogViewScreen()
    }
}

struct DetailView: View {
    var food: Food

    var body: some View {
        VStack {
            Text(food.name).font(.title)
            HStack {
                Text("\(food.name) verry delicious")
            }
            Spacer()
        }
    }
}
