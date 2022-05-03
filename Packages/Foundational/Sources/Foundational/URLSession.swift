//
//  Created by Noah Knudsen on 03/05/2022.
//

import Foundation

@available(iOS, deprecated: 15.0, message: "Backported APIs no longer required after iOS15")
public extension URLSession {
    
    func data(from url: URL) async throws -> (Data, URLResponse) {
        try await data(for: URLRequest(url: url))
    }

    func data(for request: URLRequest) async throws -> (Data, URLResponse) {
        var dataTask: URLSessionDataTask?
        let onCancel = { dataTask?.cancel() }

        return try await withTaskCancellationHandler(
            handler: {
                onCancel()
            },
            operation: {
                try await withCheckedThrowingContinuation { continuation in
                    dataTask = self.dataTask(with: request) { data, response, error in
                        guard let data = data, let response = response else {
                            let error = error ?? URLError(.badServerResponse)
                            return continuation.resume(throwing: error)
                        }

                        continuation.resume(returning: (data, response))
                    }

                    dataTask?.resume()
                }
            }
        )
    }
}
