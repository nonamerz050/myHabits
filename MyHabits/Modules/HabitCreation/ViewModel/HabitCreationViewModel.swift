//
//  HabitCreationViewModel.swift
//  MyHabits
//
//  Created by Artem Kolesnik on 08.04.2025.
//


import Foundation

final class HabitCreationViewModel: ObservableObject {
    @Published var name: String
    @Published var frequencies: [Frequency]

    private let originalHabit: Habit?
    
    let onSave: (Habit) -> Void
    
    var isEditing: Bool {
        originalHabit != nil
    }

    init(habit: Habit?, onSave: @escaping (Habit) -> Void) {
        self.originalHabit = habit
        self.onSave = onSave
        self.name = habit?.name ?? ""
        self.frequencies = habit?.frequencies ?? []
    }

    @MainActor
    func save() {
            let habit = Habit(
                id: originalHabit?.id ?? UUID(),
                name: name,
                frequencies: frequencies,
                createdAt: originalHabit?.createdAt ?? .now,
                completedDates: originalHabit?.completedDates ?? [],
                notificationTiming: originalHabit?.notificationTiming,
                notificationIDs: originalHabit?.notificationIDs ?? []
            )

            onSave(habit)
        }
}
