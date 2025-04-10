//
//  Habit.swift
//  MyHabits
//
//  Created by Artem Kolesnik on 08.04.2025.
//

import Foundation
import SwiftData

struct Habit: Identifiable, Equatable, Hashable {
    var id: UUID
    var name: String
    var frequencies: [Frequency]
    var createdAt: Date
    var completedDates: [TimeInterval]
    var notificationTiming: Date?
    var notificationIDs: [String]

    init(id: UUID,
         name: String,
         frequencies: [Frequency],
         createdAt: Date = .now,
         completedDates: [TimeInterval] = [],
         notificationTiming: Date? = nil,
         notificationIDs: [String] = []) {
        self.id = id
        self.name = name
        self.frequencies = frequencies
        self.createdAt = createdAt
        self.completedDates = completedDates
        self.notificationTiming = notificationTiming
        self.notificationIDs = notificationIDs
    }

    var isNotificationEnabled: Bool {
        !notificationIDs.isEmpty && notificationTiming != nil
    }
}
