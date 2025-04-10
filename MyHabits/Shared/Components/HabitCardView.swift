//
//  HabitCardView.swift
//  MyHabits
//
//  Created by Artem Kolesnik on 08.04.2025.
//

import SwiftUI

struct HabitCardView: View {
    var animationID: Namespace.ID
    var habit: Habit
    var onComplete: () -> Void = {}
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 10) {
                VStack(alignment: .leading, spacing: 5) {
                    Text(habit.name)
                        .font(.callout)

                    Text("Created At " + habit.createdAt.format("dd MMM, YYYY"))
                        .font(.caption2)
                        .foregroundStyle(.gray)
                }

                Spacer(minLength: 0)

                completionProgressIndicator()
            }

            HabitCalendarView(
                createdAt: habit.createdAt,
                frequncies: habit.frequencies,
                completedDates: habit.completedDates
            )
            .applyPaddedBackground(10)
            .matchedTransitionSource(id: habit.id, in: animationID)

            if habit.frequencies.contains(where: { $0.rawValue == Date.now.weekDay })
                && !habit.completedDates.contains(Date.now.startOfDay.timeIntervalSince1970) {
                CompleteButton()
            }
        }
    }

    @ViewBuilder
    func completionProgressIndicator() -> some View {
        let habitMatchingDates = Date.datesInThisMonth.filter { date in
            habit.frequencies.contains { $0.rawValue == date.weekDay } &&
            date.startOfDay >= habit.createdAt.startOfDay
        }

        let habitsCompleted = habitMatchingDates.filter {
            habit.completedDates.contains($0.timeIntervalSince1970)
        }

        let progress = CGFloat(habitsCompleted.count) / CGFloat(habitMatchingDates.count)

        VStack(spacing: 6) {
            ZStack {
                Circle()
                    .stroke(.fill, lineWidth: 3)

                Circle()
                    .trim(from: 0, to: progress)
                    .stroke(.green.gradient, lineWidth: 3)
                    .rotationEffect(.degrees(-90))
            }
            .frame(width: 30, height: 30)

            Text("\(habitsCompleted.count)/\(habitMatchingDates.count)")
                .font(.caption2)
                .foregroundStyle(.gray)
        }
    }

    @ViewBuilder
    func CompleteButton() -> some View {
        VStack(spacing: 10) {
            Text("Have you completed the habit today?")
                .font(.callout)

            HStack(spacing: 10) {
                Button("Yes, Completed 🎉") {
                    withAnimation(.snappy) {
                        onComplete()
                    }
                }
                .buttonStyle(.borderedProminent)

                Button("Skip") {
                    // TODO: действие
                }
                .buttonStyle(.bordered)
            }
        }
        .padding()
        .applyPaddedBackground(12)
    }
}
