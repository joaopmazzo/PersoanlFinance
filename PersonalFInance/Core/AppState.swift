//
//  AppState.swift
//  PersonalFInance
//
//  Created by João Paulo Mazzo on 03/03/25.
//

import SwiftUI

class AppState: ObservableObject {
    @AppStorage("hasCreatedAccount") var hasCreatedAccount: Bool = false
    @AppStorage("hasLaunchedBefore") var hasLaunchedBefore: Bool = false
}
