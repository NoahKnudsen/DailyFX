import XCTest
import Foundational
@testable import DailyFXService

final class DailyFXService_Tests: XCTestCase {
    
    fileprivate var session: URLSessionMock!
    var service: DailyFXService!
    
    override func setUp() async throws {
        session = URLSessionMock()
        service = DailyFXService(session: session)
    }
    
    func test_calls_dashboard_endpoint_and_returns_Dashboard_model() async throws {
        
        let expected = Dashboard.testData
        let expectation = expectation(description: "request made")
        
        session.handler = { request in
            XCTAssertEqual(request.url, Endpoint.dashboard.url)
            expectation.fulfill()
            return (try! expected.json(), URLResponse(), nil)
        }
        
        for try await result in service.dashboard() {
            XCTAssertEqual(result, expected.model)
        }
        
        await waitForExpectations(timeout: 0.1)
    }
    
    func test_calls_markets_endpoint_and_returns_Markets_model() async throws {
        
        let expected = Markets.testData
        let expectation = expectation(description: "request made")
        
        session.handler = { request in
            XCTAssertEqual(request.url, Endpoint.markets.url)
            expectation.fulfill()
            return (try! expected.json(), URLResponse(), nil)
        }
        
        for try await result in service.markets() {
            XCTAssertEqual(result, expected.model)
        }
        
        await waitForExpectations(timeout: 0.1)
    }
    
}

private class URLSessionMock: URLSession {
    
    var handler: (URLRequest) -> (Data?, URLResponse?, Error?) = { _ in
        (nil, nil, String.Error("URLSessionMock handler not implemented"))
    }
    
    // Note: MovieDatabaseService uses the async method `data(for: URLRequest)`
    // which seems to be an async wrapper around the following `dataTask` version.
    // We cannot override the async version directly.
    override func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        
        return URLSessionDataTaskMock {
            let (data, response, error) = self.handler(request)
            completionHandler(data, response, error)
        }
        
    }
}

private class URLSessionDataTaskMock: URLSessionDataTask {
    
    private let closure: () -> Void

    init(closure: @escaping () -> Void) {
        self.closure = closure
    }
    
    override func resume() {
        closure()
    }
}

