//
//  DIContainer.swift
//  MyHabits
//
//  Created by Artem Kolesnik on 08.04.2025.
//

import Foundation

final class DIContainer: ObservableObject {
    static let shared = DIContainer()
    lazy var habitService: HabitServiceProtocol = HabitServiceMock()
    
    init() {}
}
