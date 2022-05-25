//
//  Constants.swift
//  Devote
//
//  Created by Camila Campana on 23/05/22.
//

import SwiftUI

// MARK: - FORMATTER

let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

// MARK: - UI

var backgroundGradient: LinearGradient {
    LinearGradient(
        gradient: Gradient(colors: [.pink, .blue]),
        startPoint: .topLeading, endPoint: .bottomTrailing
    )
}

// MARK: - UX

let feedback = UINotificationFeedbackGenerator()
