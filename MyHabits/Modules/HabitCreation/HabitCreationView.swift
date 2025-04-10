//
//  HabitCreationView.swift
//  MyHabits
//
//  Created by Artem Kolesnik on 08.04.2025.
//

import SwiftUI

struct HabitCreationView: View {
    @StateObject private var viewModel: HabitCreationViewModel

    init(viewModel: HabitCreationViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        Form {
            Section(header: Text("Name")) {
                TextField("Enter habit name", text: $viewModel.name)
            }

            Section(header: Text("Frequency")) {
                ForEach(Frequency.allCases, id: \.self) { frequency in
                    Toggle(frequency.rawValue.capitalized, isOn: Binding(
                        get: { viewModel.frequencies.contains(frequency) },
                        set: { isOn in
                            if isOn {
                                viewModel.frequencies.append(frequency)
                            } else {
                                viewModel.frequencies.removeAll { $0 == frequency }
                            }
                        }
                    ))
                }
            }

            Button(action: {
                viewModel.save()
            }) {
                Text("Save Habit")
                    .frame(maxWidth: .infinity)
            }
            .disabled(viewModel.name.isEmpty || viewModel.frequencies.isEmpty)
        }
        .navigationTitle(viewModel.isEditing ? "Edit Habit" : "New Habit")
    }
}
