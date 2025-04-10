//
//  HomeViewModel.swift
//  MyHabits
//
//  Created by Artem Kolesnik on 08.04.2025.
//

import Foundation
import Combine

final class HomeViewModel: ObservableObject {
    @Published var habits: [Habit] = []
    @Published var selectedHabit: Habit?
    @Published var username: String = ""

    private let habitService: HabitServiceProtocol

    init(habitService: HabitServiceProtocol) {
        self.habitService = habitService
        self.username = "User"
    }
    
    @MainActor
    func loadHabits() {
        Task {
            do {
                habits = try await habitService.fetchHabits()
            } catch {
                print("Failed to load habits: \\(error.localizedDescription)")
            }
        }
    }
    
    func complete(habit: Habit) {
        guard let index = habits.firstIndex(where: { $0.id == habit.id }) else { return }

        let today = Date.now.startOfDay.timeIntervalSince1970

        if !habits[index].completedDates.contains(today) {
            habits[index].completedDates.append(today)
        }
    }
    
    func updateHabit(_ updatedHabit: Habit) {
        guard let index = habits.firstIndex(where: { $0.id == updatedHabit.id }) else { return }
        habits[index] = updatedHabit
    }

    func deleteHabit(_ habit: Habit) {
        habits.removeAll { $0.id == habit.id }
    }

    func createHabit(_ habit: Habit) {
        habits.insert(habit, at: 0)
    }
}
