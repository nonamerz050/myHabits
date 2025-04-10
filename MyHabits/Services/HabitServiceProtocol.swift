//
//  HabitServiceProtocol.swift
//  MyHabits
//
//  Created by Artem Kolesnik on 08.04.2025.
//


import Foundation

protocol HabitServiceProtocol {
    func fetchHabits() async throws -> [Habit]
}