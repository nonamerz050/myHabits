//
//  HomeViewBuilder.swift
//  MyHabits
//
//  Created by Artem Kolesnik on 08.04.2025.
//


import SwiftUI

struct HomeViewBuilder {
    static func makeView() -> some View {
        let viewModel = HomeViewModel(habitService: DIContainer.shared.habitService)
        return HomeScreen(viewModel: viewModel)
    }
}
