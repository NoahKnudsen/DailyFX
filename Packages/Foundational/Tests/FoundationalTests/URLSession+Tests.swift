import XCTest
@testable import Foundational

final class URLSession_Tests: XCTestCase {

    private var session: URLSession!
    private var fileURL: URL!
    private let fileContents = "Hello"

    override func setUpWithError() throws {
        try super.setUpWithError()

        session = URLSession(configuration: .ephemeral)
        let fileName = UUID().uuidString
        fileURL = URL(fileURLWithPath: NSTemporaryDirectory() + fileName)
        try Data(fileContents.utf8).write(to: fileURL)
    }

    override func tearDown() {
        super.tearDown()
        try? FileManager.default.removeItem(at: fileURL)
    }

    func test_data_from_url() async throws {
        let (data, response) = try await session.data(from: fileURL)
        let string = String(decoding: data, as: UTF8.self)
        
        XCTAssertEqual(string, fileContents)
        XCTAssertEqual(response.url, fileURL)
    }

    func test_data_from_url_error() async {
        let invalidURL = fileURL.appendingPathComponent("doesNotExist")
        
        await Assert(
            throwsError: { _ = try await session.data(from: invalidURL) },
            validate: { "\($0)".contains(invalidURL.absoluteString) }
        )
    }

    func test_data_for_request() async throws {
        let request = URLRequest(url: fileURL)
        let (data, response) = try await session.data(for: request)
        let string = String(decoding: data, as: UTF8.self)

        XCTAssertEqual(string, fileContents)
        XCTAssertEqual(response.url, fileURL)
    }

    func test_data_for_request_error() async {
        let invalidURL = fileURL.appendingPathComponent("doesNotExist")
        let request = URLRequest(url: invalidURL)
        
        await Assert(
            throwsError: { try await session.data(for: request) },
            validate: { "\($0)".contains(invalidURL.absoluteString) }
        )
    }

    func testCancellingParentTaskCancelsDataTask() async throws {
        let task = Task { try await session.data(from: fileURL) }
        Task { task.cancel() }

        await Assert(
            throwsError: { _ = try await task.value },
            validate: { ($0 as? URLError)?.code == .cancelled }
        )
    }
}

private extension XCTestCase {
    
    func Assert<T>(
        throwsError: () async throws -> T,
        validate: ((Error) -> Bool)? = nil,
        _ file: StaticString = #filePath,
        _ line: UInt = #line
    ) async {
        do {
            _ = try await throwsError()
            XCTFail("Expected error to be thrown", file: file, line: line)
        } catch {
            if let validate = validate {
                XCTAssertTrue(validate(error), file: file, line: line)
            }
        }
    }
}
