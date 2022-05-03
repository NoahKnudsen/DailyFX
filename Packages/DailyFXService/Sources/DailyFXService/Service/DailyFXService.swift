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
    
    func dashboard() -> AsyncThrowingStream<Dashboard, Error> {
        fetch(URL("https://content.dailyfx.com/api/v1/dashboard"))
    }
    
    func markets() -> AsyncThrowingStream<Markets, Error> {
        fetch(URL("https://content.dailyfx.com/api/v1/markets"))
    }
}

extension DailyFXService {
    
    func fetch<T: Decodable>(_ url: URL) -> AsyncThrowingStream<T, Error> {
        AsyncThrowingStream<T, Error>{ continuation in
            Task {
                do {
                    let (data, _) = try await session.data(from: url.peek("🌍"))
                    continuation.yield(try JSONDecoder().decode(T.self, from: data))
                    continuation.finish()
                } catch {
                    print("❌", error)
                    continuation.finish(throwing: error)
                }
            }
        }
    }
}
