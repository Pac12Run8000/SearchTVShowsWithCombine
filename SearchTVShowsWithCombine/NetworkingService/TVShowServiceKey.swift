import SwiftUI
import Combine


// Define an environment key for the TVShowServiceProtocol
struct TVShowServiceKey: EnvironmentKey {
    static let defaultValue: TVShowServiceProtocol = TVShowServiceImpl(bearerToken: "bearer token")
}

extension EnvironmentValues {
    var tvShowService: TVShowServiceProtocol {
        get { self[TVShowServiceKey.self] }
        set { self[TVShowServiceKey.self] = newValue }
    }
}
