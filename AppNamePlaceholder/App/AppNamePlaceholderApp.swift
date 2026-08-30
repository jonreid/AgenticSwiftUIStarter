import SwiftUI

@main
struct AppNamePlaceholderApp: App {
    var body: some Scene {
        WindowGroup {
            if isProduction {
                ContentView()
            }
        }
    }

    private var isProduction: Bool {
        NSClassFromString("XCTestCase") == nil
    }
}
