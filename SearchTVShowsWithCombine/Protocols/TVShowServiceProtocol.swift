import Combine
import Foundation

protocol TVShowServiceProtocol {
    func fetchData(query: String) -> AnyPublisher<TVShowSearch, Error>
}
