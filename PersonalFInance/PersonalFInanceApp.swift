//
//  PersonalFInanceApp.swift
//  PersonalFInance
//
//  Created by João Paulo Mazzo on 01/03/25.
//

import SwiftUI
import SwiftData

@main
struct PersonalFInanceApp: App {
    @StateObject private var authModel = AuthenticationModel()
    @StateObject private var loadingManager = LoadingManager()
    @StateObject private var appState = AppState()

    @State private var authPath = NavigationPath()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $authPath) {
                ZStack {
                    DesignSystem.Colors.beige100.ignoresSafeArea()
                    
                    Group {
                        if authModel.isAuthenticated {
                            BottomBarView()
                        } else if !appState.hasLaunchedBefore || !appState.hasCreatedAccount {
                            AuthenticationScreen(initialView: "signup")
                                .onAppear {
                                    if !appState.hasLaunchedBefore {
                                        appState.hasLaunchedBefore = true
                                    }
                                }
                        } else {
                            AuthenticationScreen(initialView: "Login")
                        }
                    }
                    .withLoading()
                }
            }
            .environmentObject(appState)
            .environmentObject(authModel)
            .environmentObject(loadingManager)
            .onAppear {
                authModel.tryRestoreAuthentication()
            }
        }
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}


//PersonalFinance/
//├── Info.plist
//├── PersonalFinance.entitlements
//├── Core/
//│   ├── Services/
//│   │   └── Networking/
//│   │       └── APIClient.swift
//│   ├── Utils/
//│   │   ├── Extensions/
//│   │   │   └── ViewExtensions.swift
//│   │   └── Helpers/
//│   │       └── Constants.swift
//│   └── Resources/
//│       ├── Localizable.strings
//│       └── Constants/
//├── Modules/
//│   ├── Features/
//│   │   ├── Home/
//│   │   │   ├── Screens/
//│   │   │   │   └── HomeScreen.swift
//│   │   │   ├── Components/
//│   │   │   │   ├── BalanceCardView.swift
//│   │   │   │   └── BottomBarView.swift
//│   │   │   └── Models/
//│   │   │       └── Balance.swift
//│   │   └── Authentication/
//│   │       ├── Screens/
//│   │       │   ├── LoginScreen.swift
//│   │       │   └── SignUpScreen.swift
//│   │       └── Views/
//│   │           └── AuthFormView.swift
//│   └── Shared/
//│       ├── UI/
//│       │   ├── Components/
//│       │   │   └── CustomButton.swift
//│       │   └── Themes/
//│       │       ├── Colors/
//│       │       │   ├── Colors.swift
//│       │       │   └── ColorExtensions.swift
//│       │       └── Typography/
//│       │           ├── Typography.swift
//│       │           └── TypographyExtensions.swift
//│       └── Models/
//│           └── User.swift
//└── Resources/
//├── Assets.xcassets
//└── Preview Content/
