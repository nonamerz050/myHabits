//
//  ViewsFactoryProtocol.swift
//  MyHabits
//
//  Created by Artem Kolesnik on 08.04.2025.
//

import SwiftUI

// MARK: - ViewsFactory Protocol
protocol ViewsFactoryProtocol {
    associatedtype Body: View
    @ViewBuilder static func build(_ module: FactoryModule) -> Body
}
