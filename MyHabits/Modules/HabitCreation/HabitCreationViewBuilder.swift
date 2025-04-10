//
//  HabitCreationViewBuilder.swift
//  MyHabits
//
//  Created by Artem Kolesnik on 08.04.2025.
//


import SwiftUI

struct HabitCreationViewBuilder {
    static func makeView(habit: Habit?, onSave: @escaping (Habit) -> Void) -> some View {
        let viewModel = HabitCreationViewModel(habit: habit, onSave: onSave)
        return HabitCreationView(viewModel: viewModel)
    }
}
