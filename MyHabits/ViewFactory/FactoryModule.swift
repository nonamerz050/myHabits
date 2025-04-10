//
//  FactoryModule.swift
//  MyHabits
//
//  Created by Artem Kolesnik on 08.04.2025.
//


enum FactoryModule {
    case home
    case habitCreation(habit: Habit?, onSave: (Habit) -> Void)
}
