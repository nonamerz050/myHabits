//
//  ViewsFactory.swift
//  MyHabits
//
//  Created by Artem Kolesnik on 08.04.2025.
//


import SwiftUI

struct ViewsFactory: ViewsFactoryProtocol {
    @ViewBuilder
    static func build(_ module: FactoryModule) -> some View {
        switch module {
        case .home:
            HomeViewBuilder.makeView()
        case let .habitCreation(habit, onSave):
            HabitCreationViewBuilder.makeView(habit: habit, onSave: onSave)
        }
    }
}
