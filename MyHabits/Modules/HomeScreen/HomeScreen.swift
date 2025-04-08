//
//  HomeScreen.swift
//  MyHabits
//
//  Created by Artem Kolesnik on 08.04.2025.
//

import SwiftUI

struct HomeScreen: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("Habit Tracker")
                    .font(.largeTitle.bold())

                Text("Welcome! This screen will list your habits.")
                    .foregroundStyle(.secondary)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(.systemGroupedBackground))
            .navigationTitle("Home")
        }
    }
}

#Preview {
    HomeScreen()
}
