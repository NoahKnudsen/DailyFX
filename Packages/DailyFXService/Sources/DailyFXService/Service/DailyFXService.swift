//
//  Created by Noah Knudsen on 03/05/2022.
//

import Foundational
import Combine

public class DailyFXService: ObservableObject {
    
    let session: URLSession
    
    public init(session: URLSession = .shared) {
        self.session = session
    }
}

public extension DailyFXService {
    
    func dashboard() async throws -> AnyPublisher<Dashboard, Error> {
        fetch(URL("https://content.dailyfx.com/api/v1/dashboard"))
    }
}

extension DailyFXService {
    
    func fetch<T: Decodable>(_ url: URL) -> AnyPublisher<T, Error> {
        return session.dataTaskPublisher(for: url.peek("🌍"))
            .map(\.data)
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
