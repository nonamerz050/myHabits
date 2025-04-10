//
//  HabitServiceMock.swift
//  MyHabits
//
//  Created by Artem Kolesnik on 08.04.2025.
//

import Foundation

final class HabitServiceMock: HabitServiceProtocol {
    func fetchHabits() async throws -> [Habit] {
        return [
            Habit(
                id: UUID(),
                name: "Read for 30 minutes",
                frequencies: [.monday, .wednesday, .friday]
            ),
            Habit(
                id: UUID(),
                name: "Workout",
                frequencies: [.tuesday, .thursday]
            )
        ]
    }
}
