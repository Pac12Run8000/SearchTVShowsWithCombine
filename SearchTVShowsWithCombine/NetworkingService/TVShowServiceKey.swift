import SwiftUI
import Combine


// Define an environment key for the TVShowServiceProtocol
struct TVShowServiceKey: EnvironmentKey {
    static let defaultValue: TVShowServiceProtocol = TVShowServiceImpl(bearerToken: "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxYWZmMGYyYTJlMDUxOTMyNzk2ODYxZGI2YTI0NmQ3NSIsIm5iZiI6MTcyMzEzMjM1Mi40Mzk0MDEsInN1YiI6IjU5MzY5N2UyOTI1MTQxNmJlZTAwZDA2ZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.sWoqEyowmKf8SCNvfbJnyF2ZM3HO34IdfCXDl9TdKEc")
}

extension EnvironmentValues {
    var tvShowService: TVShowServiceProtocol {
        get { self[TVShowServiceKey.self] }
        set { self[TVShowServiceKey.self] = newValue }
    }
}
