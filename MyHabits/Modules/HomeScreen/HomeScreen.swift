//
//  HomeScreen.swift
//  MyHabits
//
//  Created by Artem Kolesnik on 08.04.2025.
//

import SwiftUI

struct HomeScreen: View {
    @StateObject var viewModel: HomeViewModel
    @Namespace private var animationID
    
    init(viewModel: HomeViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack(spacing: 15) {
                headerView()
                    .padding(.bottom, 15)
                
                ForEach(viewModel.habits) { habit in
                    HabitCardView(animationID: animationID, habit: habit) {
                        viewModel.complete(habit: habit)
                    }
                    .onTapGesture {
                        viewModel.selectedHabit = habit
                    }
                }
            }
            .padding(15)
            .overlay {
                if viewModel.habits.isEmpty {
                    ContentUnavailableView("Start tracking your habits", systemImage: "checkmark.seal.fill")
                        .fixedSize(horizontal: false, vertical: true)
                        .visualEffect { content, proxy in
                            content
                                .offset(y: ((proxy.bounds(of: .scrollView)?.height ?? 0) - 50) / 2)
                        }
                }
            }
        }
        .toolbarVisibility(.hidden, for: .navigationBar)
        .safeAreaInset(edge: .bottom) {
            createButton()
        }
        .background {
            Rectangle()
                .fill(.primary.opacity(0.05))
                .ignoresSafeArea()
                .scaleEffect(1.5)
        }
        .navigationDestination(item: $viewModel.selectedHabit) { habit in
            habitDestination(for: habit)
        }
    }
    
    @ViewBuilder
        private func habitDestination(for habit: Habit) -> some View {
            ViewsFactory.build(.habitCreation(habit: habit, onSave: { newHabit in
                viewModel.habits.append(newHabit)
            }))
                .navigationTransition(.zoom(sourceID: habit.id, in: animationID))
    }
    
    @ViewBuilder
    private func headerView() -> some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("Welcome Back!")
                .font(.largeTitle.bold())
            
            HStack(spacing: 0) {
                Text(viewModel.username)
                    .fontWeight(.semibold)
                    .lineLimit(1)
                
                Text(", " + Date.startDateOfThisMonth.format("MMMM YY"))
                    .textScale(.secondary)
                    .foregroundStyle(.gray)
            }
            .font(.title3)
        }
        .hSpacing(.leading)
    }
    
    @ViewBuilder
    private func createButton() -> some View {
        NavigationLink {
            ViewsFactory.build(.habitCreation(habit: nil, onSave: { newHabit in
                
            }))
                .navigationTransition(.zoom(sourceID: "CREATEBUTTON", in: animationID))
        } label: {
            buttonLabel
        }
        .hSpacing(.center)
        .padding(.vertical, 10)
        .background {
            buttonBackground
        }
    }
    
    private var buttonLabel: some View {
        HStack(spacing: 10) {
            Text("Create Habit")
            Image(systemName: "plus.circle.fill")
        }
        .foregroundStyle(.white)
        .fontWeight(.semibold)
        .padding(.horizontal, 20)
        .padding(.vertical, 10)
        .background(.green.gradient, in: .capsule)
        .matchedTransitionSource(id: "CREATEBUTTON", in: animationID)
    }
    
    private var buttonBackground: some View {
        Rectangle()
            .fill(.background)
            .mask {
                Rectangle()
                    .fill(.linearGradient(colors: [
                        .white.opacity(0),
                        .white.opacity(0.5),
                        .white,
                        .white
                    ], startPoint: .top, endPoint: .bottom))
            }
            .ignoresSafeArea()
            .scaleEffect(3, anchor: .top)
    }
}
