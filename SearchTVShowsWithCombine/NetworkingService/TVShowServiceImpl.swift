import Foundation
import Combine

class TVShowServiceImpl: TVShowServiceProtocol {
    private let baseURL = URL(string: "https://api.themoviedb.org/3/search/tv")!
    private let bearerToken: String

    init(bearerToken: String) {
        self.bearerToken = bearerToken
    }

    func fetchData(query: String) -> AnyPublisher<TVShowSearch, Error> {
        var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: false)!
        components.queryItems = [URLQueryItem(name: "query", value: query)]

        var request = URLRequest(url: components.url!)
        request.httpMethod = "GET"
        request.setValue("Bearer \(bearerToken)", forHTTPHeaderField: "Authorization")

        return URLSession.shared.dataTaskPublisher(for: request)
            .map(\.data)
            .decode(type: TVShowSearch.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
